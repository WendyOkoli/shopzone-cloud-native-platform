const express = require("express");

const router = express.Router();

router.get("/", (req, res) => {

    res.json({
        status: "healthy",
        application: "ShopZone",
        customer: "ShopZone",
        deployedBy: "Descasio",
        timestamp: new Date()
    });

});

module.exports = router;