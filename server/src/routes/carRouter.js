const express = require('express');
const carModel = require('../models/carModel');
const multer = require('multer');

const carRouter = express.Router();

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "../images"); 
  },
  filename: function (req, file, cb) {
    cb(null, file.filename);
  }
});

const upload = multer({ storage: storage });

carRouter.post('/images', upload.single("file"), (req, res) => {
  return res.json("file uploaded");
});

carRouter.post('/car', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,
      car_details: req.body.car_details,
      car_image: req.body.car_image, // Change to req.file.filename to store the uploaded file name
      status: "0", // Assuming status is a string, use quotes
      seat: req.body.seat,
      District: req.body.District,
      auto: req.body.auto,
      petrol: req.body.petrol,
      prize: req.body.prize,
      name: req.body.name,
      location: req.body.location,
      discription: req.body.discription // Fixed the typo in the field name
    };

    const savedData = await carModel.create(data); // Use create() to simplify the saving process
    console.log(savedData);

    return res.status(200).json({
      success: true,
      error: false,
      details: savedData,
      message: "Registration completed"
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

carRouter.get('/carfinb/:district', async function (req, res) {
  try {
    const district = req.params.district;
    const cars = await carModel.find({ District: district });

    return res.status(200).json({
      success: true,
      error: false,
      cars: cars,
      message: "Cars found by district"
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


module.exports = carRouter;
