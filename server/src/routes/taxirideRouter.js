const express = require('express');
const taxirideModel = require('../models/taxirideModel');
const userModel = require('../models/userModel');

const { default: mongoose } = require('mongoose')
const taxirideRouter = express.Router();
const objectid = mongoose.Types.ObjectId

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
      taxi_id:null,
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

      const allUser = await taxirideModel.aggregate([
          {
            '$lookup': {
              'from': 'user_tbs', 
              'localField': 'user_id', 
              'foreignField': '_id', 
              'as': 'user'
          }
          },
          {
              '$unwind':"$user"
          },
         
          {
              '$group':{
                 
                  'address':{'$first':'$address'},
                  'destination':{'$first':'$destination'},
                  'Date':{'$first':'$Date'},
                  'Date':{'$first':'$last_name'},
                  'Status':{'$first':'$Status'},
                  'pickup':{'$first':'$pickup'},
                  'ace':{'$first':'$ace'},
                  'posting_date':{'$first':'$posting_date'},
                  'posting_tim':{'$first':'$posting_tim'},
                  'first_name':{'$first':'$user.first_name'},
                  
      
                  'last_name':{'$first':'$user.last_name'},
                  'last_name':{'$first':'$user.last_name'},
                  
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

taxirideRouter.get('/viewuse/:id', async function (req, res) { 
  try {
      const userId = req.params.id; 
console.log(userId);
      const allUser = await userModel.aggregate([
          
          {
              '$lookup': {
                  'from': 'login_tbs',
                  'localField': 'login_id',
                  'foreignField': '_id',
                  'as': 'login'
              }
          },
          {
              '$unwind': "$login"
          },
          {
            '$match': { 'login._id': new objectid (userId) } 
        },
          {
              '$group': {
                  '_id': '$_id',
                  'login_id': { '$first': '$login._id' },
                  'idcard': { '$first': '$idcard' },
                  'first_name': { '$first': '$first_name' },
                  'Phone_no': { '$first': '$Phone_no' },
                  'last_name': { '$first': '$last_name' },
                  'status': { '$first': '$login.status' },
                  'address': { '$first': '$address' },
                  'email': { '$first': '$email' },
                  'gender': { '$first': '$gender' },
                  'username': { '$first': '$login.username' },
                  'idcardimag':{'$first':'$idcardimag'},
              }
          }
      ]);

      if (allUser.length === 0) { 
          return res.status(400).json({
              success: false,
              error: true,
              message: "No data exist"
          });
      }

      return res.status(200).json({
          success: true,
          error: false,
          data: allUser
      });

  } catch (error) {
      return res.status(400).json({
          success: false,
          error: true,
          message: "Something went wrong"
      });
  }
});

module.exports = taxirideRouter;
