class UserModel {
  final String name;
  final String phoneNumber;
  final String profilePic;
  final String uid;
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.profilePic,
    required this.uid,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "profilePic": profilePic,
      "user_id": uid,
      "email": email,
      "password": password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"],
      phoneNumber: map["phoneNumber"],
      profilePic: map["profilePic"],
      uid: map["user_id"],
      email: map["email"],
      password: map["password"],
    );
  }
}
