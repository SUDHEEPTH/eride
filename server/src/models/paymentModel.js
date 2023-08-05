const mongoose = require("mongoose");

const schema = mongoose.Schema

const paymentSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'login_tb' },
    resive_id: { type: mongoose.Types.ObjectId, ref:' driver_tb',ref:' taxi_tb',ref:' user_tb'},
    
    amount: { type: String },
    date: { type: String },
    time: { type: String },
    status: { type: String },
    what: { type: mongoose.Types.ObjectId, ref:' driver_booking_tb',ref:' taxiride_tb',ref:' share_ride_tb'},
 
  
    
})

const paymentModel = mongoose.model('payment_tb',paymentSchema)
module.exports = paymentModel