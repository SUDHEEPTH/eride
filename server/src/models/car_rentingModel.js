const mongoose = require("mongoose");

const schema = mongoose.Schema

const car_rentingSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    carid: { type: mongoose.Types.ObjectId, ref:'user_tb' },
    car_renting_date: { type: String },
    car_renting_time: { type: String },
    ace:{ type: String },
    status: { type: String },
    com: { type: String },
    date: { type: String },
    days: { type: String },
    
    
  
    
})

const car_rentingModel = mongoose.model('car_renting_tb',car_rentingSchema)
module.exports = car_rentingModel