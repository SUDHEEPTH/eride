const mongoose = require("mongoose");

const schema = mongoose.Schema

const share_rideSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    starting_place: { type: String },
    ending_place: { type: String },
    starting_time: { type: String },
    message: { type: String },
    posting_date: { type: String },
    posting_tim: { type: String },
   
  
    
})

const share_rideModel = mongoose.model('share_ride_tb',share_rideSchema)
module.exports = share_rideModel