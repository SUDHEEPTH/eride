const express = require('express')
const userModel = require('../models/userModel')

const taxiModel = require('../models/taxiModel')
const driverMOdel = require('../models/driverModel')
const loginModel = require('../Models/loginModel')

const registerRouter = express.Router()
registerRouter.get('/view-driver', async function (req, res) {
    try {

        const allUser = await driverMOdel.aggregate([
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

registerRouter.get('/view-taxi', async function (req, res) {
    try {

        const allUser = await taxiModel.aggregate([
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

registerRouter.get('/view-users', async function (req, res) {
    try {

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
                '$unwind':"$login"
            },
            {
                '$match':{
                    'login.status':'0'
                }
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
            success:true,
            error:false,
            message:"Something went wrong"
        })
    }
})


registerRouter.get('/viewstatus-users', async function (req, res) {
    try {

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
                '$unwind':"$login"
            },
            {
                '$match':{
                    'login.status':'1'
                }
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
            success:true,
            error:false,
            message:"Something went wrong"
        })
    }
})


registerRouter.post('/user-register', async function (req, res) {
    try {

        const oldUser = await loginModel.findOne({ username: req.body.username })
        if(oldUser){
           return res.status(400).json({
                success:true,
                error:false,
                message:"User already exist"
            })
        }
        const oldPhone = await userModel.findOne({ Phone_no: req.body.phoneNumber })
        if(oldPhone){
           return res.status(400).json({
                success:true,
                error:false,
                message:"Phone number already exist"
            })
        }

        const log_data = {
            username: req.body.username,
            password: req.body.password,
            role: 1,
            status: 0,
        }
        const save_login = await loginModel(log_data).save()
        if(save_login){
            const user_data = {
                login_id:save_login._id, 
                first_name: req.body.firstName,
                last_name: req.body.lastName,
                Phone_no: req.body.phoneNumber,
                password: req.body.password,
                email: req.body.email,    
                address: req.body.address,    
                gender: req.body.gender,    
                dob: req.body.dob,
                img1: req.body.img1,  


            }
            const save_user = await userModel(user_data).save()
            if(save_user){
                return res.status(200).json({
                     success:true,
                     error:false,
                     details:save_user,
                     message:"Registration completed"
                 })
             }
        }
       
      
    } catch (error) {
        return res.status(400).json({
            success:true,
            error:false,
            message:"Something went wrong"
        })
    }
})

registerRouter.post('/taxi-register', async function (req, res) {
    try {

        const oldUser = await loginModel.findOne({ username: req.body.username })
        if(oldUser){
           return res.status(400).json({
                success:true,
                error:false,
                message:"User already exist"
            })
        }
        const oldPhone = await taxiModel.findOne({ Phone_no: req.body.phoneNumber })
        if(oldPhone){
           return res.status(400).json({
                success:true,
                error:false,
                message:"Phone number already exist"
            })
        }

        const log_data = {
            username: req.body.username,
            password: req.body.password,
            role: 2,
            status: 0,
        }
        const save_login = await loginModel(log_data).save()
        if(save_login){
            const user_data = {
                login_id:save_login._id, 
                first_name: req.body.firstName,
                last_name: req.body.lastName,
                Phone_no: req.body.phoneNumber,
                password: req.body.password,
                email: req.body.email,    
                address: req.body.address,    
                gender: req.body.gender,    
                dob: req.body.dob,  
                car_num : req.body.car_num,
            }
            const save_user = await taxiModel(user_data).save()
            if(save_user){
                return res.status(200).json({
                     success:true,
                     error:false,
                     details:save_user,
                     message:"Registration completed"
                 })
             }
        }
       
      
    } catch (error) {
        return res.status(400).json({
            success:true,
            error:false,
            message:"Something went wrong"
        })
    }
})

registerRouter.post('/driver-register', async function (req, res) {
    try {

        const oldUser = await loginModel.findOne({ username: req.body.username })
        if(oldUser){
           return res.status(400).json({
                success:true,
                error:false,
                message:"User already exist"
            })
        }
        const oldPhone = await driverMOdel.findOne({ Phone_no: req.body.phoneNumber })
        if(oldPhone){
           return res.status(400).json({
                success:true,
                error:false,
                message:"Phone number already exist"
            })
        }

        const log_data = {
            username: req.body.username,
            password: req.body.password,
            role: 3,
            status: 0,
        }
        const save_login = await loginModel(log_data).save()
        if(save_login){
            const user_data = {
                login_id:save_login._id, 
                first_name: req.body.firstName,
                last_name: req.body.lastName,
                Phone_no: req.body.phoneNumber,
                password: req.body.password,
                email: req.body.email,    
                address: req.body.address,    
                gender: req.body.gender,    
                dob: req.body.dob,  
                car_num : req.body.car_num,
            }
            const save_user = await driverMOdel(user_data).save()
            if(save_user){
                return res.status(200).json({
                     success:true,
                     error:false,
                     details:save_user,
                     message:"Registration completed"
                 })
             }
        }


        
       
      
    } catch (error) {
        return res.status(400).json({
            success:false,
            error:true,
            message:"Something went wrong"
        })
    }
})

registerRouter.get('/approve/:id', async (req, res) => {
    try {
      const id = req.params.id;
 const approve = await loginModel.updateOne({ _id: id }, { $set: { status: 1 } });
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
  registerRouter.get('/reject/:id', async (req, res) => {
    try {
      const id = req.params.id;
  
      const reject = await loginModel.deleteOne({ _id: id });
  
      if (reject && reject.deletedCount === 1) {
        return res.status(200).json({
          success: true,
          message: 'User rejected',
        });
      } else if (reject && reject.deletedCount === 0) {
        return res.status(400).json({
          success: false,
          message: 'User not found or already rejected',
        });
      } else {
        throw new Error('Error deleting user');
      }
    } catch (error) {
      return res.status(400).json({
        success: false,
        message: 'Something went wrong',
        details: error.message,
      });
    }
  });

  
  registerRouter.get('/view-detail/:id', async function (req, res) {
    try {
      const id = req.params.id;
  
      const user = await userModel.aggregate([
        {
          '$match': {
            'id': mongoose.Types.ObjectId(id)
          }
        },
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
          '$group': {
            '_id': '$_id',
            'id': { '$first': '$login._id' },
            'first_name': { '$first': '$first_name' },
            'Phone_no': { '$first': '$Phone_no' },
            'last_name': { '$first': '$last_name' },
            'status': { '$first': '$login.status' },
            'address': { '$first': '$address' },
            'email': { '$first': '$email' },
            'gender': { '$first': '$gender' },
            'username': { '$first': '$login.username' },
          }
        }
      ]);
  
      if (!user.length) {
        return res.status(400).json({
          success: false,
          error: true,
          message: "User not found"
        });
      }
  
      return res.status(200).json({
        success: true,
        error: false,
        data: user[0]
      });
  
    } catch (error) {
      return res.status(400).json({
        success: false,
        error: true,
        message: "Something went wrong"
      });
    }
  });
  
 
  
  
  


module.exports = registerRouter