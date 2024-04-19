class UserModel {
  final String name;
  final String phoneNumber;
  final String profilePic;
  final String userToken;
  final String uid;
  final String email;
  final String password;
  final String? priceFair;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.profilePic,
    required this.userToken,
    required this.uid,
    required this.email,
    required this.password,
    this.priceFair,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "profilePic": profilePic,
      "userToken": userToken,
      "user_id": uid,
      "email": email,
      "password": password,
      "pricefair": priceFair,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"],
      phoneNumber: map["phoneNumber"],
      profilePic: map["profilePic"],
      userToken: map["userToken"],
      uid: map["user_id"],
      email: map["email"],
      password: map["password"],
      priceFair: map["pricefair"],
    );
  }
}
