import express from "express";

import { pool } from "../db/pool";

const router = express.Router();

router.use(express.json());

router.use((req, res, next) => { console.log(""); next(); });

router.get("/", async ( req, res ) => {
	try {
		const result = await pool.query(
			`SELECT id,
                    title,
                    description,
                    status,
				    TO_CHAR(created_at, 'YYYY-MM-DD') AS create_dt,
				    TO_CHAR(updated_at, 'YYYY-MM-DD') AS update_dt
             FROM tasks
             ORDER BY id `,
		);
		//res.json(result.rows);
		res.setHeader('Content-Type', 'application/x-ndjson');
		result.rows.forEach((item) => {
    		res.write(JSON.stringify(item) + '\n\n');
		});
		res.end();

	} catch (error) {
		console.error("Failed to fetch tasks:", error);
		res.status(500).json({
			status: "error",
			message: "Failed to fetch tasks",
		});
	}
});





router.post("/", async ( req, res, next ) => {

	try{

		const { title, description, status } = req.body;
	}
	catch (error) {
		console.error("Bad request", error);
		res.status(400).json({
			status: "error",
			message: "Bad request (check your JSON format).",
		});
	}

	const { title, description, status } = req.body;

	if ( title === "" || !title ) {
		console.log("Title is required when creating a new task");
		res.status(400).json({
			status: 400,
			message: "Title is required when creating a new task"
		});
		return res;
	}

	const sql = `INSERT INTO tasks ( title, description, status )
        		 VALUES ( $1, $2, $3 )
				 RETURNING id, title, description, status,
				  		   TO_CHAR(created_at, 'YYYY-MM-DD') AS create_dt,
						   TO_CHAR(updated_at, 'YYYY-MM-DD') AS update_dt;`;

	const values = [ title, description, status ];

	try {
		const result = await pool.query( sql, values );
		//res.status(201).json(result.rows[0]);
		res.status(201);
		res.setHeader('Content-Type', 'application/x-ndjson');
		res.write(JSON.stringify(result.rows[0]));
		res.end("\n");
	}
	catch (error) {
		// console.error("Failed to create task:", error);
		// res.status(500).json({
		// 	status: "error",
		// 	message: "Failed to create task",
		// });
		next(error);
	}
});

router.get('/:id', async ( req, res ) => {
  	const taskId = req.params.id;
  
  	try {
	    const sql = `SELECT id, title, description, status,
					 TO_CHAR(created_at, 'YYYY-MM-DD') AS create_dt,
  				     TO_CHAR(updated_at, 'YYYY-MM-DD') AS update_dt
					 FROM tasks
					 WHERE id = $1`;
    	const result = await pool.query( sql , [taskId] );

	    if (result.rows.length === 0) {
    	  return res.status(404).json({ status: 404 , error: 'Task not found' });
    	}

		//res.json(result.rows[0]);

		res.setHeader('Content-Type', 'application/x-ndjson');
		res.write(JSON.stringify(result.rows[0]));
		res.end("\n");

	}
  	catch (error) {
    	console.log("Server error", error);
    	res.status(500).json({ error: 'Server error' });
  	}
});


router.patch('/:id', async (req, res) => {

	const taskId = req.params.id;
  	const { title, description, status } = req.body;
    const values = [title, description, status, taskId];
	console.log(values);

	try {
	    const sql = `
    		UPDATE tasks 
      		SET 
	        	title = COALESCE($1, title),
    	    	description = COALESCE($2, description),
        		status = COALESCE($3, status)
      		WHERE id = $4
			RETURNING id, title, description, status,
					  TO_CHAR(created_at, 'YYYY-MM-DD') AS create_dt,
					  TO_CHAR(updated_at, 'YYYY-MM-DD') AS update_dt;`;

	const result = await pool.query(sql, values);

    if (result.rows.length === 0) {
    	return res.status(404).json({ error: 'Task not found' });
    }

    const data = { status: "ok", updated: result.rows[0] };

	res.setHeader('Content-Type', 'application/x-ndjson');
	res.write(JSON.stringify(data));
	res.end("\n");
	//res.json(result.rows[0]);   "\n"
	//res.send(JSON.stringify(data));

	}
	catch (error) {
	    console.error( "Server error" , error );
    	res.status(500).json({ error: 'Server error' });
	}
});

router.delete('/:id', async (req, res) => {
	const taskId = req.params.id;
	const values = [taskId];
	try {
	    const sql = `DELETE FROM tasks 
      				 WHERE id = $1
				     RETURNING id, title, description, status,
					 TO_CHAR(created_at, 'YYYY-MM-DD') AS create_dt,
					 TO_CHAR(updated_at, 'YYYY-MM-DD') AS update_dt;`;

    const result = await pool.query( sql, values );

    if (result.rowCount === 0) {
      return res.status(404).json({ error: 'Task not found' });
    }

    const data = { status: "ok", deleted: result.rows[0] };

	res.setHeader('Content-Type', 'application/x-ndjson');
	res.write(JSON.stringify(data));
	res.end("\n");

	//res.json(result.rows[0]);   "\n"
	//res.send(JSON.stringify(data));
    // res.json({ message: 'Task deleted successfully', deletedTask: result.rows[0] });

} catch (error) {
    res.status(500).json({ error });
  }
});

// router.use((err, req, res, next) => {
// 	console.log(err);
// 	if ( err.status === 400 || err instanceof SyntaxError ) {
// 		return res.status(400).json({ 
// 			status: "error",
// 			message: "Malformed JSON payload provided." 
// 		});
// 	}
// 	next(err); // Pass down other errors to the default Express handler
// });

export default router;
