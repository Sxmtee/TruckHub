class UserModel {
  final String name;
  final String uid;
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "uid": uid,
      "email": email,
      "password": password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"],
      uid: map["uid"],
      email: map["email"],
      password: map["password"],
    );
  }
}
