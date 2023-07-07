const express = require('express');
const mongoose = require("mongoose");
const registerRouter = require('./src/routes/registerRouter');
const loginRouter = require('./src/routes/loginRouter');
const car_rentingRouter = require('./src/routes/car_rentingRouter');
const carRouter = require('./src/routes/carRouter');
const driver_bookingRouter = require('./src/routes/driver_bookingRouter');
const paymentRouter = require('./src/routes/paymentRouter');
const reviewRouter = require('./src/routes/reviewRouter');
const share_rideRouter = require('./src/routes/share_rideRouter');


const app = express();


app.use(express.urlencoded({ extended: true }));

app.get('/', function (req, res) {
  res.send("hellossdfsdf");
});

app.use('/register', registerRouter);
app.use('/login', loginRouter);
app.use('/car_renting', car_rentingRouter);
app.use('/car', carRouter);
app.use('/driver_booking', driver_bookingRouter);
app.use('/payment', paymentRouter);
app.use('/review', reviewRouter);
app.use('/share_ride', share_rideRouter);

mongoose.connect('mongodb+srv://dxad004:dxad004@cluster0.mnvtpxk.mongodb.net/E-rideDB?retryWrites=true&w=majority').then(()=>{
  app.listen(3000, function () {
    console.log("Server started at http://localhost:3000");
  });
}).catch((err)=>{
  console.log(err);
})


