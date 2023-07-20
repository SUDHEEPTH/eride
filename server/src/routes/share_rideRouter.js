const express = require('express');
const { default: mongoose } = require('mongoose');
const share_rideModel = require('../models/share_rideModel');
const takeriseModel = require('../models/takeriseModel');
const objectid = mongoose.Types.ObjectId
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
      starting_placedis: req.body.starting_placedis,
      ending_placedis: req.body.ending_placedis,
      price: req.body.price,
      date: req.body.date,
      status: "0",
    
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

share_rideRouter.get('/shareridesearch/:district1/:district2/:date/:id', async function (req, res) {
  try {
    const dis1 = req.params.district1;
    console.log(dis1);
    const dis2 = req.params.district2;
    console.log(dis2);
    const date1 = req.params.date;
    console.log(date1);
    const uid = req.params.id;
    console.log(uid);
    const cars = await share_rideModel.find({ starting_placedis:dis1,ending_placedis: dis2,date: date1});
    
    const datas = cars.filter((single)=>{
      return single.user_id != uid
    })
    console.log(datas);
    return res.status(200).json({
      success: true,
      error: false,
      cars: datas,
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

share_rideRouter.get('/sharerideview/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await share_rideModel.aggregate([
          {
              '$lookup': {
                  'from': 'user_tbs', 
                  'localField': 'user_id', 
                  'foreignField': 'login_id', 
                  'as': 'user'
              }
          },
          
          {
              '$unwind':"$user"
          },
      
            {

              '$match': { '_id': new objectid (userId) } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
                  
                  'starting_place':{'$first':'$starting_place'},
                  'ending_place':{'$first':'$ending_place'},
                  'starting_time':{'$first':'$starting_time'},
                  'person':{'$first':'$person'},
                  'starting_placedis':{'$first':'$starting_placedis'},
                  'ending_placedis':{'$first':'$ending_placedis'},
                 
                  'status':{'$first':'$status'},
                  'date':{'$first':'$date'},
                  
                  'first_name':{'$first':'$user.first_name'},
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





module.exports = share_rideRouter;
