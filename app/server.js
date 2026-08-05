const express = require("express");
const path = require("path");

const app = express();
const PORT = process.env.PORT || 3000;

// Backend routes
const healthRoute = require("./backend/routes/health");
const productsRoute = require("./backend/routes/products");
const ordersRoute = require("./backend/routes/orders");

// Serve frontend
app.use(express.static(path.join(__dirname, "frontend")));

// API routes
app.use("/health", healthRoute);
app.use("/api/products", productsRoute);
app.use("/api/orders", ordersRoute);

// Homepage
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "frontend", "index.html"));
});

app.listen(PORT, () => {
    console.log(`ShopZone running on http://localhost:${PORT}`);
});