const pool = require("./backend/db/db");

async function test() {
    console.log("Connecting...");

    try {
        const result = await pool.query("SELECT * FROM products");
        console.log(result.rows);
    } catch (err) {
        console.error(err);
    } finally {
        await pool.end();
    }
}

test();