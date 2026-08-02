import { Router } from "express";
import { pool } from "../env.js";

const router = Router();

router.get("/", async ( req, res) => {
    try {
        const result = await pool.query("SELECT TO_CHAR(NOW(), 'YYYY-MM-DD') AS current_date");
        res.status(200).json({ message: "Database online and connected.",
                               currentDate: result.rows[0].current_date
        });
    } catch (error) {
        console.error("Database health check failed:", error);
        res.status(500).json({ message: "Unknown error.  Database not connected." });
    }
});

export default router;
