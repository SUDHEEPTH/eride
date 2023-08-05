try {
    const id = req.params.id;
    console.log(id);
    const taxiride = await driver_bookingModel.findOne({ _id: id, ace: 1 });
    console.log(taxiride);

    if (!taxiride) {
      return res.status(400).json({
        success: false,
        message: 'Not paid',
      });
    }