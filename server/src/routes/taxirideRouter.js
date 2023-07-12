const express = require('express');
const taxirideModel = require('../models/taxirideModel');

const taxirideRouter = express.Router();

taxirideRouter.post('/taxiride', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,
      address: req.body.address,
      destination: req.body.destination,
      posting_date: req.body.posting_date,
      posting_tim: req.body.posting_tim,
      Date: req.body.Date,
      Status: '0',
      pickup: '0',
      ace: '0',
      taxi_id:"64a5390b69140b96667af959",
    };

    const savedData = await taxirideModel(data).save();
    console.log(savedData);

    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "Ride shared"
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

taxirideRouter.get('/viewtaxi', async function (req, res) {
  try {
    const cars = await taxirideModel.find();
    return res.status(200).json({
      success: true,
      error: false,
      cars: cars,
      message: "data found"
    });
  } catch (error) {
    console.log(error);
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong"
    });
  }
});

module.exports = taxirideRouter;
