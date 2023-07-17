class TaxiModel{
  final String fname;
  final String destination;
  final String lname;
  final String address;
  final String posting_date;
  final String posting_tim;
  final String taxi_id;
  final String Date;
  final String time;
  final String idcardimag;
  final String id;


  TaxiModel({required this.fname,
    required this.address,
    required this.lname,
    required this.posting_date,
    required this.destination,
    required this.taxi_id,
    required this.posting_tim,
    required this.Date,
    required this.time,
    required this.idcardimag,
    required this.id,
  });

  factory TaxiModel.fromJson(Map<String, dynamic> json) {
    return TaxiModel(
      destination: json['destination'],
      id: json['_id'],
      fname: json['first_name'],
      lname: json['last_name'],
      address: json['address'],
      posting_date: json['posting_date'],
      posting_tim: json['posting_tim'],
      taxi_id: json['taxi_id']==null?"":json['taxi_id'],
      Date: json['Date'],
      time: json['time'],
      idcardimag: json['idcardimag'],

    );
  }
}