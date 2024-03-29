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
    const cars = await share_rideModel.find({ starting_placedis:dis1,ending_placedis: dis2,date:date1});
    
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
                  'price':{'$first':'$price'},
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
});
share_rideRouter.post('/takeride2', async function (req, res) {
  try {
    const data = {
      user_id: req.body.user_id,        
      shareid: req.body.shareid,   
      status:"0",     
      pay:"1",     
      cancel:"0",     
      
};

    const savedData = await takeriseModel(data).save();
    console.log(savedData);
    
    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "request shared"
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



share_rideRouter.get('/sharerideview2/:id', async function (req, res) {
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

              '$match': { 'user.login_id': new objectid (userId) } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
                  
                  'starting_place':{'$first':'$starting_place'},
                  'ending_place':{'$first':'$ending_place'},
                  'starting_time':{'$first':'$starting_time'},
                  'price':{'$first':'$price'},
                  'person':{'$first':'$person'},
                  'starting_placedis':{'$first':'$starting_placedis'},
                  'ending_placedis':{'$first':'$ending_placedis'},
                 
                  'status':{'$first':'$status'},
                  'date':{'$first':'$date'},
                  'date':{'$first':'$date'},
                  'user_id2':{'$first':'$user_id'},
                  'first_name':{'$first':'$user.first_name'},
                  'last_name':{'$first':'$user.last_name'},
                  'userid':{'$first':'$user._id'},
                  'userlogin_id':{'$first':'$user.login_id'},
                  
                  
                  
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
});


share_rideRouter.get('/sharerideview22/:id', async function (req, res) {
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
                  'price':{'$first':'$price'},
                  'person':{'$first':'$person'},
                  'starting_placedis':{'$first':'$starting_placedis'},
                  'ending_placedis':{'$first':'$ending_placedis'},
                 
                  'status':{'$first':'$status'},
                  'date':{'$first':'$date'},
                  'date':{'$first':'$date'},
                  'user_id2':{'$first':'$user_id'},
                  'first_name':{'$first':'$user.first_name'},
                  'last_name':{'$first':'$user.last_name'},
                  'pic':{'$first':'$user.profilepic'},
                  'userid':{'$first':'$user._id'},
                  'Phone_no':{'$first':'$user.Phone_no'},
                  'email':{'$first':'$user.email'},
                  'userlogin_id':{'$first':'$user.login_id'},
                  
                  
                  
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
});


share_rideRouter.get('/sharerideview66/:id', async function (req, res) {
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

              '$match': { 'user_id': new objectid (userId) } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
                  
                  'starting_place':{'$first':'$starting_place'},
                  'ending_place':{'$first':'$ending_place'},
                  'starting_time':{'$first':'$starting_time'},
                  'price':{'$first':'$price'},
                  'person':{'$first':'$person'},
                  'starting_placedis':{'$first':'$starting_placedis'},
                  'ending_placedis':{'$first':'$ending_placedis'},
                 
                  'status':{'$first':'$status'},
                  'date':{'$first':'$date'},
                  'user_id2':{'$first':'$user_id'},
                  
                  'first_name':{'$first':'$user.first_name'},
                  'last_name':{'$first':'$user.last_name'},
                  'userid':{'$first':'$user._id'},
                  'userlogin_id':{'$first':'$user.login_id'},
                  
                  
                  
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
});

share_rideRouter.get('/shareride5/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await takeriseModel.aggregate([
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
                'from': 'share_ride_tbs', 
                'localField': 'shareid', 
                'foreignField': '_id', 
                'as': 'share'
            }
        },
          {
              '$unwind':"$user"
          },
        
          {
            '$unwind':"$share"
        },
      
            {

              '$match': { 'share.user_id': new objectid (userId),'status':'0', } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
              
                  
                  'first_name':{'$first':'$user.first_name'},
                  'status':{'$first':'$status'},
                  'last_name':{'$first':'$user.last_name'},
                  'Phone_no':{'$first':'$user.Phone_no'},
                  'email':{'$first':'$user.email'},
                  'gender':{'$first':'$user.gender'},
                  'shareID':{'$first':'$share._id'},
                  'shareuser':{'$first':'$share.user_id'},
                  'profilepic':{'$first':'$user.profilepic'},
                  'user_id2':{'$first':'$user_id'},
                  
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
share_rideRouter.get('/shareride88/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await takeriseModel.aggregate([
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
                'from': 'share_ride_tbs', 
                'localField': 'shareid', 
                'foreignField': '_id', 
                'as': 'share'
            }
        },
          {
              '$unwind':"$user"
          },
        
          {
            '$unwind':"$share"
        },
      
            {

              '$match': { 'share.user_id': new objectid (userId),'status':"1" } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
              
                  
                  'first_name':{'$first':'$user.first_name'},
                  'status':{'$first':'$status'},
                  'user_idt':{'$first':'$user_id'},
                  'shareidt':{'$first':'$shareid'},
                  'last_name':{'$first':'$user.last_name'},
                  'Phone_no':{'$first':'$user.Phone_no'},
                  'email':{'$first':'$user.email'},
                  'gender':{'$first':'$user.gender'},
                  'shareID':{'$first':'$share._id'},
                  'shareuser':{'$first':'$share.user_id'},
                  'starting_placedis':{'$first':'$share.starting_placedis'},
                  'ending_placedis':{'$first':'$share.ending_placedis'},
                  'date':{'$first':'$share.date'},
                  'profilepic':{'$first':'$user.profilepic'},
                  'user_id2':{'$first':'$user_id'},
                  
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
share_rideRouter.get('/shareride880/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await takeriseModel.aggregate([
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
                'from': 'share_ride_tbs', 
                'localField': 'shareid', 
                'foreignField': '_id', 
                'as': 'share'
            }
        },
          {
              '$unwind':"$user"
          },
        
          {
            '$unwind':"$share"
        },
      
            {

              '$match': { 'share.user_id': new objectid (userId),'status':"0" } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
              
                  
                  'first_name':{'$first':'$user.first_name'},
                  'status':{'$first':'$status'},
                  'user_idt':{'$first':'$user_id'},
                  'shareidt':{'$first':'$shareid'},
                  'last_name':{'$first':'$user.last_name'},
                  'Phone_no':{'$first':'$user.Phone_no'},
                  'email':{'$first':'$user.email'},
                  'gender':{'$first':'$user.gender'},
                  'shareID':{'$first':'$share._id'},
                  'shareuser':{'$first':'$share.user_id'},
                  'starting_placedis':{'$first':'$share.starting_placedis'},
                  'ending_placedis':{'$first':'$share.ending_placedis'},
                  'date':{'$first':'$share.date'},
                  'profilepic':{'$first':'$user.profilepic'},
                  'user_id2':{'$first':'$user_id'},
                  
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



share_rideRouter.get('/shareride6/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await takeriseModel.aggregate([
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
                'from': 'share_ride_tbs', 
                'localField': 'shareid', 
                'foreignField': '_id', 
                'as': 'share'
            }
        },
          {
              '$unwind':"$user"
          },
        
          {
            '$unwind':"$share"
        },
      
            {

              '$match': { 'share._id': new objectid (userId) } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
              
                  
                  'first_name':{'$first':'$user.first_name'},
                  'user_id':{'$first':'$user_id'},
                  'last_name':{'$first':'$user.last_name'},
                  'Phone_no':{'$first':'$user.Phone_no'},
                  'email':{'$first':'$user.email'},
                  'gender':{'$first':'$user.gender'},
                  'shareID':{'$first':'$share._id'},
                  'shareuser':{'$first':'$share.user_id'},
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

share_rideRouter.get('/shareride77/:id', async function (req, res) {
  try {
    const userId= req.params.id; 
        console.log(userId);

      const allUser = await takeriseModel.aggregate([
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
                'from': 'share_ride_tbs', 
                'localField': 'shareid', 
                'foreignField': '_id', 
                'as': 'share'
            }
        },
          {
              '$unwind':"$user"
          },
        
          {
            '$unwind':"$share"
        },
      
            {

              '$match': { 'user_id': new objectid (userId) } 
          },

         
          {
              '$group':{
                  '_id':'$_id',
                  'pay':{'$first':'$pay'},
                  
                  'first_name':{'$first':'$user.first_name'},
                  'user_id':{'$first':'$user_id'},
                  'last_name':{'$first':'$user.last_name'},
                  'Phone_no':{'$first':'$user.Phone_no'},
                  'email':{'$first':'$user.email'},
                  'gender':{'$first':'$user.gender'},
                  'shareID':{'$first':'$share._id'},
                  
                  'starting_place':{'$first':'$share.starting_place'},
                  'ending_place':{'$first':'$share.ending_place'},
                  'starting_time':{'$first':'$share.starting_time'},
                  'starting_placedis':{'$first':'$share.starting_placedis'},
                  'ending_placedis':{'$first':'$share.ending_placedis'},
                  'user_id2':{'$first':'$share.user_id'},
                  'price':{'$first':'$share.price'},
                  'date':{'$first':'$share.date'},
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


share_rideRouter.get('/rideacc/:id', async (req, res) => {
  try {
    const id = req.params.id;
const oldData = await share_rideModel.findOne({ _id: id });
console.log(oldData);
const newNo = parseInt(oldData.person) - 1
const updatePerson = await share_rideModel.updateOne({ _id: id }, { $set: { person: newNo } });
const approve = await takeriseModel.updateOne({ shareid: id }, { $set: { status: 1 } });
 console.log(approve);
    if (approve && approve.modifiedCount === 1) {
      return res.status(200).json({
        success: true,
        message: 'User approved',
      });
    } else if (approve && approve.modifiedCount === 0) {
      return res.status(400).json({
        success: false,
        message: 'User not found or already approved',
      });
    } else {
      throw new Error('Error updating user');
    }
  } catch (error) {
    return res.status(400).json({
      success: false,
      message: 'Something went wrong',
      details: error.message,
    });
  }
});



module.exports = share_rideRouter;
