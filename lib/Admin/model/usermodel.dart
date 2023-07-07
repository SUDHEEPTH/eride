class UserModel{
  final String fname;
  final String id;
  final String lname;
  final String lid;


  UserModel({required this.fname,
    required this.id,
    required this.lname,
    required this.lid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fname: json['first_name'],
      lname: json['last_name'],
      lid: json['id'],

    );
  }
}