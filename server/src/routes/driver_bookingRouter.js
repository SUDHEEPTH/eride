const express = require('express');
const driverModel = require('../models/driverModel');

const driver_bookingRouter = express.Router();

driver_bookingRouter.post('/driver_booking', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,        
      driver_id: req.body.driver_id,
      driver_booking_time: req.body.driver_booking_time,
      driver_booking_date: req.body.driver_booking_date,
    };

    const savedData = ((await driverModel(data)).save());
    console.log(savedData);
    
    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "Registration completed"
      });
    }
  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong"
    });
  }
});

module.exports = driver_bookingRouter;
