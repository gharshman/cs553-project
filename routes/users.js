import { Router } from "express";
import { pool } from "../env.js";
import { authenticateToken , requireRole } from "./auth.js";

const router = Router();

router.get("/", authenticateToken, requireRole("admin"), async ( req, res ) => {
	try {
		const result = await pool.query(
			`SELECT * FROM users ORDER BY id;`
		);
		return res.status(200).json({ data: result.rows });
	} catch (error) {
		return res.status(500).json({ message: "Failed to load projects." });
	}
});

export default router;
