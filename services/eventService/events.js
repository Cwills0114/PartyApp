const express = require("express")
const app = express()
const mongoose = require("mongoose")
const bodyParser = require("body-parser")

app.use(bodyParser.json())

//connect
mongoose.connect("mongodb+srv://eventDB:eventDB@cluster-7md81.mongodb.net/eventservice", { useNewUrlParser: true, useUnifiedTopology: true },() => {
    console.log("databse connected - Event service")
})

// load model
require("./event")
const Event = mongoose.model("Event")   
    
app.get("/", (req, res) => {
    res.send("home - event")
} )


app.post("/createEvent", (req, res) => {
        var newEvent = {
            name: req.body.name,
            description: req.body.description,
            location: req.body.location,
            time: req.body.time
        }

        var event = new Event(newEvent)
        event.save().then(() => {
            res.send("event Created")
        }).catch((err) => {
            if(err){
                throw err
            }
        })
    })

app.get("/events", (req, res) => {
    
    Event.find().then((events) => {
        res.json(events)
    }).catch((err) => {
        if(err){
            throw err
        }
    })
})

app.listen("5555", () => {
    console.log("up and running - Event")
})