const express = require('express');
const paymentModel = require('../models/paymentModel');
const taxirideModel = require('../models/taxirideModel');
const driver_bookingModel = require('../models/driver_bookingModels');
const takeriseModel = require('../models/takeriseModel');
const car_rentingModel = require('../models/car_rentingModel');
const paymentRouter = express.Router();



paymentRouter.post('/payment', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,        
      resive_id: req.body.resive_id,
      amount: req.body.amount,
      date: req.body.date,
      time: req.body.time,
      status: req.body.status,
      what: req.body.what,
    };

    const savedData = await paymentModel(data).save();
    console.log(savedData);
    
    if (savedData) {
      // Now, update ace = 1 in the taxirideModel
      const filter = { _id: req.body.what }; // Assuming `what` field contains the document ID
      const update = { ace: 1 };
      const updatedTaxiRide = await taxirideModel.findOneAndUpdate(filter, update, { new: true });

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


paymentRouter.post('/payment5', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,        
      resive_id: req.body.resive_id,
      amount: req.body.amount,
      date: req.body.date,
      time: req.body.time,
      status: req.body.status,
      what: req.body.what,
    };

    const savedData = await paymentModel(data).save();
    console.log(savedData);
    
    if (savedData) {
      // Now, update ace = 1 in the taxirideModel
      const filter = { _id: req.body.what }; // Assuming `what` field contains the document ID
      const update = { ace: 1 };
      const updatedTaxiRide5 = await driver_bookingModel.findOneAndUpdate(filter, update, { new: true });

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

paymentRouter.post('/payment6', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,        
      resive_id: req.body.resive_id,
      amount: req.body.amount,
      date: req.body.date,
      time: req.body.time,
      status: req.body.status,
      what: req.body.what,
    };

    const savedData = await paymentModel(data).save();
    console.log(savedData);
    
    if (savedData) {
      console.log(what);
      // Now, update ace = 1 in the taxirideModel
      const filter = { _id: req.body.what }; // Assuming `what` field contains the document ID
      const update = { pay: 1 };
      const updatedTaxiRide5 = await takeriseModel.findOneAndUpdate(filter, update, { new: true });

      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "paymet completed"
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

paymentRouter.post('/payment500', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,        
      resive_id: req.body.resive_id,
      amount: req.body.amount,
      date: req.body.date,
      time: req.body.time,
      status: req.body.status,
      what: req.body.what,
    };

    const savedData = await paymentModel(data).save();
    console.log(savedData);
    
    if (savedData) {
      // Now, update ace = 1 in the taxirideModel
      const filter = { _id: req.body.what }; // Assuming `what` field contains the document ID
      const update = { ace: 1 };
      const updatedTaxiRide5 = await car_rentingModel.findOneAndUpdate(filter, update, { new: true });
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


module.exports = paymentRouter;
