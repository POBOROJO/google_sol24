const express = require("express");
const app = express();


app.get("/user1",(req,res) => {
    try{
        res.status(200).json({
            StepCount : 10000,
            Calories : 580,
            SleepTime : 8
        })
    }
    catch(e){
        console.error("Error:",e);
    }
})

app.get("/user2",(req, res) => {
    try {
      res.status(200).json({
        StepCount: 7500,
        Calories: 400,
        SleepTime: 6,
      });
    } catch (e) {
      console.error("Error:", e);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });
  
  app.get("/user3",(req, res) => {
    try {
      res.status(200).json({
        StepCount: 5000,
        Calories: 300,
        SleepTime: 5,
      });
    } catch (e) {
      console.error("Error:", e);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });
  
  app.get("/user4",(req, res) => {
    try {
      res.status(200).json({
        StepCount: 12000,
        Calories: 650,
        SleepTime: 7,
      });
    } catch (e) {
      console.error("Error:", e);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });
  
  app.get("/user5",(req, res) => {
    try {
      res.status(200).json({
        StepCount: 8000,
        Calories: 450,
        SleepTime: 7,
      });
    } catch (e) {
      console.error("Error:", e);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });
  
  app.get("/user6",(req, res) => {
    try {
      res.status(200).json({
        StepCount: 7000,
        Calories: 400,
        SleepTime: 6,
      });
    } catch (e) {
      console.error("Error:", e);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });
  
  app.get("/user7",(req, res) => {
    try {
      res.status(200).json({
        StepCount: 4000,
        Calories: 250,
        SleepTime: 4,
      });
    } catch (e) {
      console.error("Error:", e);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });
  
  app.get("/user8",(req, res) => {
    try {
      res.status(200).json({
        StepCount: 3000,
        Calories: 200,
        SleepTime: 3,
      });
    } catch (e) {
      console.error("Error:", e);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });

  app.listen(3000, () => {
    console.log("Server is running on port 3000");
  });

