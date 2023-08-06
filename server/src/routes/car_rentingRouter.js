const express = require('express');
const car_rentingModel = require('../models/car_rentingModel');
const { default: mongoose } = require('mongoose');
const carModel = require('../models/carModel');
const objectid = mongoose.Types.ObjectId

const car_rentingRouter = express.Router();

car_rentingRouter.post('/car_renting', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,
      carid: req.body.carid,
      car_renting_time: req.body.car_renting_time,
      car_renting_date: req.body.car_renting_date,
      days: req.body.days,
      date: req.body.date,
      com: "0",
      status: "0",
      ace: "0",
    };

    const savedData = await new car_rentingModel(data).save();
    console.log(savedData);

    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "Rquest sent",
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


car_rentingRouter.get('/carrent5/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await car_rentingModel.aggregate([
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
                'from': 'car_tbs', 
                'localField': 'carid', 
                'foreignField': '_id', 
                'as': 'car'
            }
        },
          {
              '$unwind':"$user"
          },
        
          {
            '$unwind':"$car"
        },
      
            {

              '$match': { 'car.user_id': new objectid (userId),'status':'0' } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
              
                  
                  'caruser':{'$first':'$car.user_id'},
                  'date':{'$first':'$date'},
                  'days':{'$first':'$days'},
                  'car_id':{'$first':'$car._id'},
                  'carstatus':{'$first':'$car.status'},
                  'carAdress':{'$first':'$car.Adress'},

                  'user_id':{'$first':'$user._id'},
                  'last_name':{'$first':'$user.last_name'},
                  'first_name':{'$first':'$user.first_name'},
                  'Phone_no':{'$first':'$user.Phone_no'},
                  'email':{'$first':'$user.email'},
                  'gender':{'$first':'$user.gender'},
              
                  'profilepic':{'$first':'$user.profilepic'},
                  
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


car_rentingRouter.get('/carrent255/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await car_rentingModel.aggregate([
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
                'from': 'car_tbs', 
                'localField': 'carid', 
                'foreignField': '_id', 
                'as': 'car'
            }
        },
          {
              '$unwind':"$user"
          },
        
          {
            '$unwind':"$car"
        },
      
            {

              '$match': { 'user_id': new objectid (userId),'status':'1','com':'0' } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
              
                  
                  'caruser':{'$first':'$car.user_id'},
                  'prize':{'$first':'$car.prize'},
                  'date':{'$first':'$date'},
                  'ace':{'$first':'$ace'},
                  'days':{'$first':'$days'},
                  'car_id':{'$first':'$car._id'},
                  'carstatus':{'$first':'$car.status'},
                  'carAdress':{'$first':'$car.Adress'},

                  'user_id':{'$first':'$user._id'},
                  'user_id58':{'$first':'$user_id'},

                  'last_name':{'$first':'$user.last_name'},
                  'first_name':{'$first':'$user.first_name'},
                  'Phone_no':{'$first':'$user.Phone_no'},
                  'email':{'$first':'$user.email'},
                  'gender':{'$first':'$user.gender'},
              
                  'profilepic':{'$first':'$user.profilepic'},
                  
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



car_rentingRouter.get('/approve66/:id', async (req, res) => {
  try {
    const id = req.params.id;
    console.log(id);
    
    const approveCarRenting = await car_rentingModel.updateOne({ carid: id }, { $set: { status: 1 } });
    console.log(approveCarRenting);

    const approveCar = await carModel.updateOne({ _id: id }, { $set: { status: 1 } });
    console.log(approveCar);
    
    if (approveCarRenting && approveCarRenting.modifiedCount === 1 && approveCar && approveCar.modifiedCount === 1) {
      return res.status(200).json({
        success: true,
        message: 'Car renting and car both approved',
      });
    } else if (approveCarRenting && approveCarRenting.modifiedCount === 0 && approveCar && approveCar.modifiedCount === 0) {
      return res.status(400).json({
        success: false,
        message: 'Car renting and car not found or already approved',
      });
    } else {
      throw new Error('Error updating car renting and car');
    }
  } catch (error) {
    return res.status(400).json({
      success: false,
      message: 'Something went wrong',
      details: error.message,
    });
  }
});

car_rentingRouter.get('/approve665/:id', async (req, res) => {
  try {
    const id = req.params.id;
    console.log(id);
    
    const approveCarRenting = await car_rentingModel.updateOne({ carid: id }, { $set: { com: 1 } });
    console.log(approveCarRenting);

    const approveCar = await carModel.updateOne({ _id: id }, { $set: { status: 0 } });
    console.log(approveCar);
    
    if (approveCarRenting && approveCarRenting.modifiedCount === 1 && approveCar && approveCar.modifiedCount === 1) {
      return res.status(200).json({
        success: true,
        message: 'Car renting and car both approved',
      });
    } else if (approveCarRenting && approveCarRenting.modifiedCount === 0 && approveCar && approveCar.modifiedCount === 0) {
      return res.status(400).json({
        success: false,
        message: 'Car renting and car not found or already approved',
      });
    } else {
      throw new Error('Error updating car renting and car');
    }
  } catch (error) {
    return res.status(400).json({
      success: false,
      message: 'Something went wrong',
      details: error.message,
    });
  }
});

module.exports = car_rentingRouter;
