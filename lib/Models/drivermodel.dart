class DriverModel {
  final String name;
  final String phoneNumber;
  final String profilePic;
  final String uid;
  final String email;

  DriverModel({
    required this.name,
    required this.phoneNumber,
    required this.profilePic,
    required this.uid,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "profilePic": profilePic,
      "user_id": uid,
      "email": email,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      name: map["name"],
      phoneNumber: map["phoneNumber"],
      profilePic: map["profilePic"],
      uid: map["user_id"],
      email: map["email"],
    );
  }
}
