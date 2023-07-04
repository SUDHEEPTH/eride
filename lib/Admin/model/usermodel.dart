class UserModel{
  final String fname;
  final String id;
  final String lname;

  UserModel({required this.fname,
    required this.id,
    required this.lname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fname: json['first_name'],
      lname: json['last_name'],

    );
  }
}