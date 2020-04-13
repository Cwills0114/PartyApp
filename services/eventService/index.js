const express = require("express");
const bodyParser = require("body-parser");
const event = require("./routes/events");
const InitiateMongoServer = require("./config/db");

// Initiate Mongo Server
InitiateMongoServer();

const app = express();

// PORT
const PORT = process.env.PORT || 5000;

// Middleware
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.json({ message: "Event API Working" });
});


/**
 * Router Middleware
 * Router - /event/*
 * Method - *
 */
app.use("/event", event);

app.listen(PORT, (req, res) => {
  console.log(`Server Started at PORT ${PORT}`);
});


