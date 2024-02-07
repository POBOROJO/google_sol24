const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());

// User 1 data
const user1Data = {
  StepCount: 10000,
  Calories: 570,
  SleepTime: 7,
  ScreenTime: 4, // Assume lower is better
  PhysicalActivity: 80, // Score out of 100
  SleepQuality: 85, // Score out of 100
  EatingHabits: 70, // Score out of 100
};

app.get("/user1", (req, res) => {
  try {
    res.status(200).json(user1Data);
  } catch (e) {
    console.error("Error:", e);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// User 2 data
const user2Data = {
  StepCount: 7500,
  Calories: 400,
  SleepTime: 6,
  ScreenTime: 5, // Assume lower is better
  PhysicalActivity: 75, // Score out of 100
  SleepQuality: 80, // Score out of 100
  EatingHabits: 60, // Score out of 100
};

app.get("/user2", (req, res) => {
  try {
    res.status(200).json(user2Data);
  } catch (e) {
    console.error("Error:", e);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
