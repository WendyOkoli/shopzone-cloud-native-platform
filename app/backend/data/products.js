const express = require("express");
const pool = require("../db/db");

const router = express.Router();

router.get("/", async (req, res) => {
    console.log("GET /api/products called");

    try {
        const result = await pool.query("SELECT * FROM products ORDER BY id");

        console.log(result.rows);

        res.json(result.rows);

    } catch (err) {
        console.error(err);

        res.status(500).json({
            error: err.message
        });
    }
});

module.exports = router;