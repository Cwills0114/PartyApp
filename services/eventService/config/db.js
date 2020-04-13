//FILENAME : db.js

const mongoose = require("mongoose");

const MONGOURI = "mongodb+srv://eventDB:eventDB@cluster-7md81.mongodb.net/eventservice";

const InitiateMongoServer = async () => {
  try {
    await mongoose.connect(MONGOURI, {
      useNewUrlParser: true,
      useUnifiedTopology: true 
    });
    console.log("Connected to DB !!");
  } catch (e) {
    console.log(e);
    throw e;
  }
};

module.exports = InitiateMongoServer;