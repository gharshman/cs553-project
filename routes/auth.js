import { Router } from "express";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { env, pool } from "../env.js";

const router = Router();


export function authenticateToken(req, res, next) {

	const authorization = req.get("authorization");

	if (!authorization?.startsWith("Bearer ")) {
    	return res.status(401).json({
    		error: "Unauthorized",
    		message: "Send a Bearer token in the Authorization header."
    	});
  	}

	const token = authorization.slice("Bearer ".length);

	try {
	    req.user = jwt.verify(token, env.secret);
    	next();
	} catch {
	    res.status(401).json({
		    error: "Unauthorized",
      		message: "The access token is missing, invalid, or expired."
	    });
  	}
}


export function requireRole(...roles) {
	return (req, res, next) => {
    	if (!roles.includes(req.user.role)) {
      		return res.status(403).json({
		        error: "Forbidden",
        		message: `This action requires one of these roles: ${roles.join(", ")}.`
			});
    	}
	    next();
  	};
}


router.post("/login", async (req, res) => {

	const username = req.body.username;
	const password = req.body.password;

	if (!username || !password) {
		return res.status(400).json({
    		error: "Bad Request",
    		message: "Username and password are required."
    	});
	}

	try {
    	const result = await pool.query(
    		"SELECT id, username, password_hash, role FROM users WHERE username = $1",
    		[username]
    	);
    	const user = result.rows[0];

    	// Use the same response for an unknown username and a wrong password.
    	if (!user || !(await bcrypt.compare(password, user.password_hash))) {
    		return res.status(401).json({
        		error: "Unauthorized",
        		message: "Invalid username or password."
    		});
    	}

		const payload = { 
			sub: String(user.id),
			username: user.username,
			role: user.role
		};

		if (!process.env.JWT_SECRET) {
			const token = jwt.sign(payload, env.secret, { expiresIn: '1h' });
		} else {
			const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '1h' });
		}

		const token = jwt.sign(payload, env.secret, { expiresIn: '1h' });

		return res.status(200).json( {	accessToken: token,
										tokenType: "Bearer",
										expiresIn: env.expires,
										user: { id: user.id, username: user.username, role: user.role }
	    });

	} catch (error) {
	    console.error("Login failed:", error);
    	res.status(500).json({ error: "Internal Server Error", message: "Login failed." });
	}
});


router.post("/register", async ( req, res ) => {
	try { const { username, password } = req.body; }
	catch (error) {
		return res.status(400).json({ message: "Bad request (allowed JSON fields are 'username' and 'password')." });
	}

	const { username, password } = req.body;

	if ( username === "" || !username ) {
		return res.status(400).json({ message: "Username is required when creating a new user." });
	}
	if ( username.length > 15 ) {
		return res.status(400).json({ message: "Username is too long (> 15 characters)." });
	}
	if ( password === "" || !password ) {
		return res.status(400).json({ message: "Password is required when creating a new user." });
	}
	if ( password.length > 15 ) {
		return res.status(400).json({ message: "Password is too long (> 15 characters)." });
	}

	const hashed_password = await bcrypt.hash(password, 10);

	const sql = `INSERT INTO users ( username, password_hash, role )
        		 VALUES ( $1, $2, $3 )
				 RETURNING id, username, password_hash, role;`;
	const values = [ username, hashed_password, "user" ];

	try {
		const result = await pool.query( sql, values );
		return res.status(201).json( { message: "User created with role 'user'.", data: result.rows[0] } );
	} catch (error) {
    	return res.status(409).json({ status: 409 , error: 'Conflict!' , message: 'User already exists.' });
	}
});


router.get("/me", authenticateToken, (req, res) => {
	res.json({ user: req.user });
});

export default router;
