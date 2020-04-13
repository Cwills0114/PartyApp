//FILENAME : db.js

const mongoose = require("mongoose");

const MONGOURI = "mongodb+srv://UsersDB:UsersDB@cluster-7md81.mongodb.net/UsersService";

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