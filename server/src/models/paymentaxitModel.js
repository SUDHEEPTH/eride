const mongoose = require("mongoose");

const schema = mongoose.Schema

const paymenttaxiSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    taxi_id: { type: mongoose.Types.ObjectId, ref:' taxi_tb' },
    amount: { type: String },
    date: { type: String },
    time: { type: String },
    status: { type: String },
 
  
    
})

const paymenttaxiModel = mongoose.model('paymenttaxi_tb',paymenttaxiSchema)
module.exports = paymenttaxiModel