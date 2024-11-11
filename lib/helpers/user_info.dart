import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = "token";
const String USER_ID = "userID";
const String USERNAME = "username";

class UserInfo {
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(TOKEN, value);
  }

  Future? getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TOKEN);
  }

  Future setUserId(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(USER_ID, value);
  }

  Future? getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USER_ID).toString();
  }

  Future setUsername(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(USERNAME, value);
  }

  Future? getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USERNAME).toString();
  }

  Future logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
