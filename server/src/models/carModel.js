const mongoose = require("mongoose");

const schema = mongoose.Schema

const carSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    car_details: { type: String },
    car_image: { type: String },
    status: { type: String },
 
  
    
})

const carModel = mongoose.model('car_tb',carSchema)
module.exports = carModel