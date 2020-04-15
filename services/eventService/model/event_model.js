const mongoose = require("mongoose")

const EventSchema = mongoose.Schema({
    title: {
        type: String,
      required: true
    },
    description: {
        type: String,
      required: true

    },
    address: {
        type: String,
      required: true
    },
    startTime: {
        type: String,
      required: false
    },
    Date: {
        type: String,
      required: false
    },
    createdAt: {
        type: Date,
        default: Date.now(),
      requiredd: true
    },
    userToken: {
        type: String,
      requiredd: true
    },
    email: {
        type: String,
        lowercase: true,
      requiredd: true
    }

})

module.exports = mongoose.model("event", EventSchema);
