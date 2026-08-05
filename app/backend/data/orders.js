const express = require("express");
const pool = require("../db/db");

const router = express.Router();

router.get("/", async (req, res) => {
    try {

        const result = await pool.query(
            "SELECT * FROM orders ORDER BY id"
        );

        res.json(result.rows);

    } catch (error) {

        console.error(error);

        res.status(500).json({
            message: "Unable to retrieve orders"
        });

    }
});

module.exports = router;