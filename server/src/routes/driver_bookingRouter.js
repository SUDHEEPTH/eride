const express = require('express');
const driverModel = require('../models/driverModel');
const { default: mongoose } = require('mongoose');
const driver_bookingModel = require('../models/driver_bookingModels');
const objectid = mongoose.Types.ObjectId

const driver_bookingRouter = express.Router();

driver_bookingRouter.post('/driver_booking', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,
      driver_id: req.body.driver_id,
      driver_booking_time: req.body.driver_booking_time,
      driver_booking_date: req.body.driver_booking_date,
      ndays: req.body.ndays,
      adres:req.body.adres,
       status:'0',
       job:req.body.job,// Fixed the field name
    };
    const savedData = await new driver_bookingModel(data).save();
    console.log(savedData);

    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "Registration completed",
      });
    }
  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong",
    });
  }
});

driver_bookingRouter.get('/viewdriver/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await driverModel.aggregate([
          {
              '$lookup': {
                  'from': 'login_tbs', 
                  'localField': 'login_id', 
                  'foreignField': '_id', 
                  'as': 'login'
              }
          },
          {
              '$unwind':"$login"
          },
        
           
            {

              '$match': { '_id': new objectid (userId) } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
                  'id':{'$first':'$login._id'},
                  'first_name':{'$first':'$first_name'},
                  'Phone_no':{'$first':'$Phone_no'},
                  'last_name':{'$first':'$last_name'},
                  'status':{'$first':'$login.status'},
                  'address':{'$first':'$address'},
                  'email':{'$first':'$email'},
                  'gender':{'$first':'$gender'},
                  'username':{'$first':'$login.username'},
                  
                  'idcardimag':{'$first':'$idcardimag'},
              }
          }
        ])
      if(!allUser){
         return res.status(400).json({
              success:false,
              error:true,
              message:"No data exist"
          })
      }
      return res.status(200).json({
          success:true,
          error:false,
          data:allUser
      })
      

    
    
  } catch (error) {
      return res.status(400).json({
          success:false,
          error: true,
          message:"Something went wrong"
      })
  }
})



driver_bookingRouter.get('/viewdriverall/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await driver_bookingModel.aggregate([
          {
              '$lookup': {
                  'from': 'user_tbs', 
                  'localField': 'user_id', 
                  'foreignField': 'login_id', 
                  'as': 'user'
              }
          },
          {
            '$lookup': {
                'from': 'driver_tbs', 
                'localField': 'driver_id', 
                'foreignField': '_id', 
                'as': 'driver'
            }
        },
          {
              '$unwind':"$user"
          },
        
          {
            '$unwind':"$driver"
        },
      
            {

              '$match': { 'driver.login_id': new objectid (userId) } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
                  'driver_booking_time':{'$first':'$driver_booking_time'},
                  'driver_booking_date':{'$first':'$driver_booking_date'},
                  'adres':{'$first':'$adres'},
                  'ndays':{'$first':'$ndays'},
                  'status':{'$first':'$status'},
                  'ndays':{'$first':'$ndays'},
                  'job':{'$first':'$job'},
                  'first_name':{'$first':'$user.first_name'},
                  'last_name':{'$first':'$user.last_name'},
                  'driverid':{'$first':'$driver_id'},
                  'driverlog':{'$first':'$driver.login_id'},
                  
              }
          }
        ])
      if(!allUser){
         return res.status(400).json({
              success:false,
              error:true,
              message:"No data exist"
          })
      }
      return res.status(200).json({
          success:true,
          error:false,
          data:allUser
      })
      

    
    
  } catch (error) {
      return res.status(400).json({
          success:false,
          error: true,
          message:"Something went wrong"
      })
  }
})

module.exports = driver_bookingRouter;
