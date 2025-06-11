const mongoose = require("mongoose");
const dotenv = require("dotenv");
dotenv.config();

const MONGO_URI = process.env.MONGODB_URI;
console.log("🔍 Debug: Loaded MONGO_URI = ", MONGO_URI); // 🔥 First checkpoint

const connectDB = async () => {
  try {
    console.log("🛠️ Trying to connect with Mongoose..."); // 🔥 Checkpoint 2

    await mongoose.connect(MONGO_URI);

    console.log("✅ MongoDB connected successfully!");
  } catch (err) {
    console.error("❌ MongoDB connection error:", err); // 🔥 Full error object
    process.exit(1);
  }
};

module.exports = connectDB;
