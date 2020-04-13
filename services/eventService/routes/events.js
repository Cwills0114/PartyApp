const express = require("express");
const { check, validationResult } = require("express-validator");
const router = express.Router();
const http = require("http");

const Event = require("../model/event_model");



router.post(
    "/createEvent",
    [
        check("name", "Name Cannot be Empty").notEmpty({ ignore_whitespace: true }),
        check("description", "Description Cannot be Empty").notEmpty({ ignore_whitespace: true }),
        check("address", "Address Cannot be Empty").notEmpty({ ignore_whitespace: true }),
        check("startTime", "Start Time Cannot be Empty").notEmpty({ ignore_whitespace: true }),
        check("Date", "Please Enter a valid Date").notEmpty({ ignore_whitespace: true }).toDate(),
        check("userToken", "Invalid User").notEmpty({ ignore_whitespace: true }),
        check("email", "Please enter a valid email").isEmail()
        
    ],
    async (req, res) => {
        // Catch any Errors
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({
                errors: errors.array()
            });
        }
        // Create a Array with new event info
        var newEvent = {
            name: req.body.name,
            description: req.body.description,
            address: req.body.address,
            startTime: req.body.startTime,
            Date: req.body.Date,
            createdAt: req.body.createdAt,

        }

        try {
            const options = {
                hostname: 'Localhost',
                port: 4000,
                path: '/user/getUserID',
                method: 'Get',
                headers: {
                    'content-type': 'application/json',
                    'accept': 'application/json',
                    'token': req.body.userToken
                }
            };
            var array = [];
            
            const reqId = http.request(options, (result) => {
                result.setEncoding('utf8');
                result.on('data', (chunk) => {
                    console.log(`BODY: ${chunk}`);
                    array.push(chunk);
                    

                });
                result.on('end', () => {
                    array = array + " ";
                    var seperate = array.split(`,`);
                    array = seperate[3];
                    seperate = array.split(':')
                    userRes = seperate[1];
                    userRes = userRes.replace('"', "")
                    userRes = userRes.replace('"', "")

                    console.log(`userRes: ${userRes}`);
                    console.log(`userRes: ${req.body.email}`);

    
                
                    if(userRes == req.body.email){
             
                            // Create new Event object based on event model
                            var event = new Event(newEvent)
                            //Push the event to database
                            event.save().then(() => {
                                res.send("event Created")
                            }).catch((err) => {
                                if (err) {
                                    throw err
                                }
                            })
                        
                    }else{
                        res.status(500).send("Invalid UserToken");
                    }
                });
            });
            
            reqId.on('error', (e) => {
                console.error(`problem with request: ${e.message}`);
            });
            
            // write data to request body
            reqId.end();


            
        } catch (err) {
            console.log(err.message);
            res.status(500).send("Error in Saving - Please contact Administrator");
        }

    }
);


router.get("/getevents", (req, res) => {

    Event.find().then((events) => {
        res.json(events)
    }).catch((err) => {
        if (err) {
            throw err
        }
    })
})

module.exports = router;
