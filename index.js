require("dotenv").config(); // 👈 NEW

const express = require("express");
const app = express();
const PORT = 3000;

const connectDB = require("./connection/db");

app.use(express.json());
app.get("/", (req, res) => {
  res.send("✅ Server is running. MongoDB should be too!");
});


connectDB().catch((err) => console.error("MongoDB Connection Error:", err));

app.listen(PORT, () => {
  console.log(`🚀 Server is running on port ${PORT}`);
});
