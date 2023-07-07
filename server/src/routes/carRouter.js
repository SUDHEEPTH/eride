const express = require('express');
const carModel = require('../models/carModel');

const carRouter = express.Router();

carRouter.post('/car', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,        
      car_details: req.body.car_details,
      car_image: req.body.car_image,
    };

    const savedData = await carModel(data).save();
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

module.exports = carRouter;
