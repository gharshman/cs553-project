import express from 'express';

import { env } from "./config/env";
import { pool } from "./db/pool";

const app = express();

app.use(express.json());

app.use((err, req, res, next) => {
    if (err instanceof SyntaxError && err.status === 400 && 'body' in err) {
		console.log('**** OH, NO! ****');
		const data = { status: 400,
					   message: "Failed due to malformed JSON payload." };
		res.write(JSON.stringify(data));
		res.end("\n");
		//res.send(JSON.stringify(data));
		//res.status(400).json({ status: "error", message: "Failed due to malformed JSON payload."
		};
    // next();
});

//app.set('json spaces', 2); 

app.use((req, res, next) => { console.log(""); next();});

app.get("/", ( req, res) => {
	const data = { status: "ok",
				   service: "cs553-api", 
				   message: "try /health, /db-health, /tasks, /task/:id" };
	//res.send(JSON.stringify(data));
	res.setHeader('Content-Type', 'application/x-ndjson');
	res.write(JSON.stringify(data));
	res.end("\n");
});


app.get("/health", ( req, res) => {
	const data = { status: "ok",
				   service: "cs553-api", 
				   message: "Node API server online" };
	//res.send(JSON.stringify(data));
	res.setHeader('Content-Type', 'application/x-ndjson');
	res.write(JSON.stringify(data));
	res.end("\n");

});


app.get("/db-health", async ( req, res) => {
	try {
		const result = await pool.query("SELECT TO_CHAR(NOW(), 'YYYY-MM-DD') AS current_date");
		const data = { status: "ok",
					   database: "connected", 
					   currentDate: result.rows[0].current_date };
		//res.send(JSON.stringify(data));
		res.setHeader('Content-Type', 'application/x-ndjson');
		res.write(JSON.stringify(data));
		res.end("\n");

	} catch (error) {
		console.error("Database health check failed:", error);
		res.status(500).json({
			status: "error",
			database: "disconnected",
		});
	}
});

import tasksRouter from "./routes/tasks.ts";

app.use('/tasks', tasksRouter);

app.use((req, res) => {
	const data = { status: 404,
				   service: "cs553-api", 
				   error: "API Endpoint Not Recognized",
				   message: "try /health, /db-health, /tasks, /task/:id" };
	res.setHeader('Content-Type', 'application/x-ndjson');
	res.write(JSON.stringify(data));
	res.end("\n");
});

app.listen(env.port, () => {
	console.log(`Server running at http://localhost:${env.port}`);
});
