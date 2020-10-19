const mongoose = require("mongoose");

const EventSchema = mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  address: {
    type: String,
    required: true,
  },
  startTime: {
    type: String,
    required: false,
  },
  Date: {
    type: String,
    required: false,
  },
  createdAt: {
    type: Date,
    default: Date.now(),
    required: true,
  },
  userToken: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    lowercase: true,
    required: true,
  },
  lat: {
    type: Number,
    lowercase: true,
    required: true,
  },
  long: {
    type: Number,
    lowercase: true,
    required: true,
  },
});

module.exports = mongoose.model("event", EventSchema);
