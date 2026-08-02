import { Router } from "express";
import { pool } from "../env.js";
import { authenticateToken , requireRole } from "./auth.js";

const router = Router();

router.get("/", authenticateToken, async ( req, res ) => {
	try {
		const result = await pool.query(
			`SELECT * FROM projects ORDER BY id;`
		);
		return res.status(200).json({ data: result.rows });
	} catch (error) {
		return res.status(500).json({ message: "Failed to load projects." });
	}
});


router.post("/", authenticateToken, async ( req, res ) => {
	try {  const { owner_id, project } = req.body;	}
	catch (error) {
		return res.status(400).json({ message: "Bad request (check your JSON format)." });
	}

	const { owner_id, project } = req.body;

	const oid = parseInt(owner_id);

	if ( owner_id === "" || !owner_id || typeof oid !== "number" ) {
		return res.status(400).json({ message: "owner_id is required (and must be an integer) when creating a new project." });
	}
	if ( project === "" || !project ) {
		return res.status(400).json({ message: "Project name is required when creating a new project." });
	}

	const sql = `INSERT INTO projects ( owner_id, project )
        		 VALUES ( $1, $2 )
				 RETURNING id, owner_id, project`;

	const values = [ oid, project ];

	try {
		const result = await pool.query( sql, values );
		return res.status(201).json( { data: result.rows[0] } );
	} catch (error) {
    	return res.status(500).json({ message: 'Unknown server error.' });
	}
});


router.get('/:id', authenticateToken, async ( req, res ) => {
  	const projId = req.params.id;
  	try {
	    const sql = `SELECT id, owner_id, project
					 FROM projects
					 WHERE id = $1
					 ORDER BY id;`;
    	const result = await pool.query( sql , [projId] );

		if (result.rows.length === 0) {
    		return res.status(404).json({ message: 'Task not found' });
    	}

		return res.status(200).json( { data: result.rows[0] } );
	} catch (error) {
    	res.status(500).json({ message: 'Unknown server error.' });
  	}
});


export default router;
