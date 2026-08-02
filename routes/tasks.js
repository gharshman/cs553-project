import { Router } from "express";
import { pool } from "../env.js";
import { authenticateToken , requireRole } from "./auth.js";

const router = Router();

router.get("/", authenticateToken, async ( req, res ) => {
    try {
        const result = await pool.query(
            `SELECT
                tasks.id AS id,
                projects.project as project,
                tasks.title AS title,
                tasks.description AS description,
                tasks.status AS status,
                TO_CHAR(tasks.created_at, 'YYYY-MM-DD') AS create_dt,
                TO_CHAR(tasks.updated_at, 'YYYY-MM-DD') AS update_dt
             FROM tasks
             INNER JOIN projects
             ON tasks.pid = projects.id
             ORDER BY tasks.id;`
        );
        return res.status(200).json({ data: result.rows });
    } catch (error) {
        return res.status(500).json({ message: "Failed to load tasks." });
    }
});


router.post("/", authenticateToken, async ( req, res ) => {
    try {  const { pid, assgnd_id, title, description, status } = req.body;	}
    catch (error) {
        return res.status(400).json({ message: "Bad request (check your JSON format)." });
    }

    const { pid, assgnd_id, title, description, status } = req.body;
    
    if ( title === "" || !title ) {
        return res.status(400).json({ message: "Title is required when creating a new task." });
    }
    if ( status === "" || !status ) {
        return res.status(400).json({ message: "Status is required when creating a new task." });
    }
    if ( pid === "" || !pid ) {
        return res.status(400).json({ message: "Project ID is required when creating a new task." });
    }
    if ( assgnd_id === "" || !assgnd_id ) {
        return res.status(400).json({ message: "Assigned_To ID is required when creating a new task." });
    }

    const prj_id = parseInt(pid);
    const asg_id = parseInt(assgnd_id);

    if ( typeof prj_id !== "number" ) {
        return res.status(400).json({ message: "Project ID must be an integer." });
    }
    if ( typeof asg_id !== "number" ) {
        return res.status(400).json({ message: "Assigned_To ID must be an integer." });
    }

    const sql = `INSERT INTO tasks ( pid, assgnd_id, title, description, status )
                 VALUES ( $1, $2, $3, $4, $5 )
                 RETURNING id, pid, assgnd_id, title, description, status,
                           TO_CHAR(created_at, 'YYYY-MM-DD') AS create_dt,
                           TO_CHAR(updated_at, 'YYYY-MM-DD') AS update_dt;`;

    const values = [ prj_id, asg_id, title, description, status ];

    try {
        const result = await pool.query( sql, values );
        return res.status(201).json( { data: result.rows[0] } );
    } catch (error) {
        return res.status(500).json({ message: 'Unknown server error.' });
    }
});


router.get('/:id', authenticateToken, async ( req, res ) => {
    const taskId = req.params.id;
    try {
        const sql = `SELECT id, pid, assgnd_id, title, description, status,
                     TO_CHAR(created_at, 'YYYY-MM-DD') AS create_dt,
                     TO_CHAR(updated_at, 'YYYY-MM-DD') AS update_dt
                     FROM tasks
                     WHERE id = $1`;
        const result = await pool.query( sql , [taskId] );

        if (result.rows.length === 0) {
            return res.status(404).json({ message: 'Task not found' });
        }

        return res.status(200).json( { data: result.rows[0] } );
    } catch (error) {
        res.status(500).json({ message: 'Unknown server error.' });
    }
});


router.patch('/:id', authenticateToken, requireRole("admin"), async (req, res) => {
    const taskId = req.params.id;

    try {
        const { pid, assgnd_id, title, description, status } = req.body;
    } catch (error) {
        return res.status(400).json({ message: "Bad request (check your JSON format)." });
    }

    const { pid, assgnd_id, title, description, status } = req.body;

    const values = [pid, assgnd_id, title, description, status, taskId];
    try {
        const sql = `UPDATE tasks SET 
                        pid = COALESCE($1, pid),
                        assgnd_id = COALESCE($2, assgnd_id),
                        title = COALESCE($3, title),
                        description = COALESCE($4, description),
                        status = COALESCE($5, status)
                     WHERE id = $6
                     RETURNING id, pid, assgnd_id, title, description, status,
                               TO_CHAR(created_at, 'YYYY-MM-DD') AS create_dt,
                               TO_CHAR(updated_at, 'YYYY-MM-DD') AS update_dt;`;
    const result = await pool.query(sql, values);

    if (result.rows.length === 0) {
        return res.status(404).json({ error: 'Task not found' });
    }
    return res.status(200).json( { data: result.rows[0] } );

    } catch (error) {
        return res.status(500).json({ message: 'Unknown server error.' });
    }
});


router.delete('/:id', authenticateToken, requireRole("admin"), async (req, res) => {
    const taskId = req.params.id;
    const values = [taskId];
    try {
        const sql = `DELETE FROM tasks 
                     WHERE id = $1
                     RETURNING id, title`;

    const result = await pool.query( sql, values );

    if (result.rowCount === 0) {
      return res.status(404).json({ error: 'Task not found' });
    }

    return res.status(200).json( { message: "Deleted.", data: result.rows[0] } );

    } catch (error) {
        return res.status(500).json({ error });
    }
});


export default router;
