import 'package:shared_preferences/shared_preferences.dart';

class TruckPreferences {
  static late SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //! Setting the preferences
  static Future setName(String nickname) async {
    await _preferences.setString("nickName", nickname);
  }

  static Future setPhone(String phone) async {
    await _preferences.setString("phone", phone);
  }

  static Future setId(int id) async {
    await _preferences.setInt("id", id);
  }

  //! Getting the preferences
  static String? getNickname() => _preferences.getString('nickName') ?? '';

  static String? getPhone() => _preferences.getString('phone') ?? '';

  static int? getId() => _preferences.getInt("id");

  //! Clearing the preferences
  static clear() => _preferences.clear();
}
