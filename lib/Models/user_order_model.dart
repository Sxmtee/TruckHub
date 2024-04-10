class UsersOrderModel {
  final String name;
  final String phoneNumber;
  final String profilePic;
  final String uid;
  final String email;
  final bool isAccepted;

  UsersOrderModel({
    required this.name,
    required this.phoneNumber,
    required this.profilePic,
    required this.uid,
    required this.email,
    required this.isAccepted,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "profilePic": profilePic,
      "user_id": uid,
      "email": email,
      "isAccepted": isAccepted,
    };
  }

  factory UsersOrderModel.fromMap(Map<String, dynamic> map) {
    return UsersOrderModel(
      name: map["name"],
      phoneNumber: map["phoneNumber"],
      profilePic: map["profilePic"],
      uid: map["user_id"],
      email: map["email"],
      isAccepted: map["isAccepted"],
    );
  }
}
