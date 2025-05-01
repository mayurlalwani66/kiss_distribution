import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_USERID = "PREFS_KEY_USERID";
const String PREFS_KEY_USEREMAIL = "PREFS_KEY_USEREMAIL";
const String PREFS_KEY_USERPHONENUMBER = "PREFS_KEY_USERPHONENUMBER";
const String PREFS_KEY_USERFIRSTNAME = "PREFS_KEY_USERFIRSTNAME";
const String PREFS_KEY_USERLASTNAME = "PREFS_KEY_USERLASTNAME";

const String PREFS_KEY_PAYMENTTYPE = "PREFS_KEY_PAYMENTTYPE";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  String getAppLanguage() {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  void setToken(String token) {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  String getToken() {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
  }

  void removeToken() {
    _sharedPreferences.remove(PREFS_KEY_TOKEN);
  }

  void setUserEmail(String userEmail) {
    _sharedPreferences.setString(PREFS_KEY_USEREMAIL, userEmail);
  }

  String getUserEmail() {
    return _sharedPreferences.getString(PREFS_KEY_USEREMAIL) ?? "";
  }

  void setUserPhoneNumber(String phoneNumber) {
    _sharedPreferences.setString(PREFS_KEY_USERPHONENUMBER, phoneNumber);
  }

  String getUserPhoneNumber() {
    return _sharedPreferences.getString(PREFS_KEY_USERPHONENUMBER) ?? "";
  }

  void setUserId(int userId) {
    _sharedPreferences.setInt(PREFS_KEY_USERID, userId);
  }

  int getUserId() {
    return _sharedPreferences.getInt(PREFS_KEY_USERID) ?? 0;
  }

  void setUserFirstName(String firstname) {
    _sharedPreferences.setString(PREFS_KEY_USERFIRSTNAME, firstname);
  }

  String getUserFirstName() {
    return _sharedPreferences.getString(PREFS_KEY_USERFIRSTNAME) ?? "";
  }

  void setUserLastName(String lastname) {
    _sharedPreferences.setString(PREFS_KEY_USERLASTNAME, lastname);
  }

  String getUserLastName() {
    return _sharedPreferences.getString(PREFS_KEY_USERLASTNAME) ?? "";
  }

  void setPaymentType(String paymentAppId) {
    _sharedPreferences.setString(PREFS_KEY_PAYMENTTYPE, paymentAppId);
  }

  String getPaymentType() {
    return _sharedPreferences.getString(PREFS_KEY_PAYMENTTYPE) ?? "";
  }
}
