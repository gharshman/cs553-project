import express from "express";
import cors from "cors";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

import { env , pool , allowedOrigins , initializeDatabase } from "./env.js";
import { authenticateToken , requireRole } from "./routes/auth.js";

import healthRouter from "./routes/health.js";
import dbhealthRouter from "./routes/dbhealth.js";
import authRouter from "./routes/auth.js";
import projectsRouter from "./routes/projects.js";
import tasksRouter from "./routes/tasks.js";
import usersRouter from "./routes/users.js";


const app = express();

app.use(express.json());

app.set('json spaces', 2);

app.use( cors( {origin: allowedOrigins} ));

app.use((err, req, res, next) => {
    if (err instanceof SyntaxError && 'body' in err && err.status === 400 ) {
		res.status(400).json({ message: "Failed due to malformed JSON payload." });
		};
    next();
});

app.get("/", ( req, res) => {
	res.status(200).json({ message: "Server okay... try /health, /db-health, /tasks, /task/:id" });
});

app.use("/auth", authRouter);
app.use("/db-health", dbhealthRouter);
app.use("/health", healthRouter);
app.use("/projects", projectsRouter);
app.use("/tasks", tasksRouter);
app.use("/users", usersRouter);

app.use((req, res) => {
	res.status(404).json({ error: "Route or endpoint not recognized." });
});


async function startServer() {
  try {

	if (!process.env.JWT_SECRET) {
		console.log("\nJWT_SECRET is not set... using the development-only secret.\n\n");
	}

    await initializeDatabase();

	app.listen(env.port, () => {
      console.log(`Server running at http://localhost:${env.port}`);
	});

  } catch (error) {
    console.error("Server startup failed:", error);
    process.exit(1);
  }
}

startServer();
