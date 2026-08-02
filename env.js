import bcrypt from "bcryptjs";
import { Pool } from "pg";

export const env = {
    port: Number(3000),
    databaseUrl: "postgresql://postgres:postgres@localhost:5432/cs453",
    host: "127.0.0.1",
    dbport: Number(5432),
    database: "cs453",
    user: "postgres",
    password: "postgres",
    secret: "development-only-change-me",
    expires: "1h"
};


export const pool = new Pool({
    connectionString: env.databaseUrl,
    host: env.host,
    port: env.dbport,
    database: env.database,
    user: env.user,
    password: env.password
});

export const allowedOrigins = [
    "http://localhost:5173",
    "http://127.0.0.1:5173"
];

export async function initializeDatabase() {

	const passwordHash = await bcrypt.hash("user-password", 10);
	const adminPasswordHash = await bcrypt.hash("admin-password", 10);
	const mgrPasswordHash = await bcrypt.hash("mgr-password", 10);

	await pool.query( `UPDATE users SET password_hash = ($1) WHERE id = 1;`, [ passwordHash ] );
	await pool.query( `UPDATE users SET password_hash = ($1) WHERE id = 2;`, [ adminPasswordHash ] );
	await pool.query( `UPDATE users SET password_hash = ($1) WHERE id = 3;`, [ mgrPasswordHash ] );
}
