const mongoose = require("mongoose");

const schema = mongoose.Schema

const taxiSchema = new schema({
    login_id: { type: mongoose.Types.ObjectId, ref:'login_tb' },
    first_name: { type: String },
    last_name: { type: String },
    Phone_no: { type: String },
    address: { type: String },
    email: { type: String },
    gender: { type: String },
    Dob: { type: String },
    car_num: { type: String },
  
    
})

const taxiModel = mongoose.model('taxi_tb',taxiSchema)
module.exports = taxiModel