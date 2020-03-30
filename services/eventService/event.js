const mongoose = require("mongoose")

mongoose.model('Event', {
    name:{
        type: String,
        require: true
    },
    description:{
        type: String,
        require: true

    },  
    location:{
        type: String,
        require: true
    },
    time:{
        type: String,
        require: true
    }
    
})