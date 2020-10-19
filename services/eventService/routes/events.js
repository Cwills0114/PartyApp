const express = require("express");
const { check, validationResult } = require("express-validator");
const router = express.Router();
const http = require("http");

const Event = require("../model/event_model");



router.post(
  "/createEvent",
  [
    check("title", "Name Cannot be Empty").notEmpty({ ignore_whitespace: true }),
    check("description", "Description Cannot be Empty").notEmpty({ ignore_whitespace: true }),
    check("address", "Address Cannot be Empty").notEmpty({ ignore_whitespace: true }),
    check("startTime", "Start Time Cannot be Empty").notEmpty({ ignore_whitespace: true }),
    check("date", "Please Enter a valid Date").notEmpty({ ignore_whitespace: true }),
    check("userToken", "Invalid User").notEmpty({ ignore_whitespace: true }),
    check("email", "Please enter a valid email").isEmail(),
    check("lat", "Please enter a valid latitude").notEmpty({ ignore_whitespace: true }),
    check("long", "Please enter a valid longitude").notEmpty({ ignore_whitespace: true }),

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
      title: req.body.title,
      description: req.body.description,
      address: req.body.address,
      startTime: req.body.startTime,
      date: req.body.Date,
      createdAt: req.body.createdAt,
      email: req.body.email,
      lat: req.body.lat,
      long: req.body.long,
      userToken: req.body.userToken, // TODO: Maybe don't store the usertoken with the Event. 
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
          userRes = userRes.replace('"', "").replace('"', "")

          console.log(`userRes: ${userRes}`);
          console.log(`userRes: ${req.body.email}`);

          if (userRes == req.body.email) {
            console.log("Trying to create Event")
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

          } else {
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


router.get("/getevents/:lat-:long-:radius", (req, res) => {
  /* 
      ``` 
      Takes in a users lat - long coordinates. Returns the events within a radius.
      FIXME? : Radius is in coordinate measuremeants not in meters.
      PARAMS:
          lat: number 
          long: number 
          radius: number 
      ```
  */
  const lat = Number(req.params.lat);
  const long = Number(req.params.long);
  const radius = Number(req.params.radius);

  Event.find()
    .where('lat').gt(lat - radius).lt(lat + radius)
    .where('long').gt(long - radius).lt(long + radius)
    .then((result) => {
      const jsonResult = JSON.parse(JSON.stringify(result))
      const Filteredevents = jsonResult.filter(function (event) {
        return Math.pow(radius, 2) > ((Math.pow((lat - event.lat), 2)) - (Math.pow((long - event.long), 2)));
      })
      console.log(Filteredevents)

      res.json(Filteredevents)
    }).catch((err) => {
      if (err) {
        throw err
      }
    })
})

module.exports = router;
