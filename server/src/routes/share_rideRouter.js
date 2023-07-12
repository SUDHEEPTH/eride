const express = require('express');

const share_rideModel = require('../models/share_rideModel');

const share_rideRouter = express.Router();

share_rideRouter.post('/shareride1', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,        
      starting_place: req.body.starting_place,
      ending_place: req.body.ending_place,
      starting_time: req.body.starting_time,
      posting_tim: req.body.posting_tim,
      posting_date: req.body.posting_date,
      person: req.body.person,
};

    const savedData = await share_rideModel(data).save();
    console.log(savedData);
    
    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "ride shared"
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




module.exports = share_rideRouter;
