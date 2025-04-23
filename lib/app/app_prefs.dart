import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_USERID = "PREFS_KEY_USERID";
const String PREFS_KEY_USEREMAIL = "PREFS_KEY_USEREMAIL";
const String PREFS_KEY_USERPHONENUMBER = "PREFS_KEY_USERPHONENUMBER";
const String PREFS_KEY_USERFIRSTNAME = "PREFS_KEY_USERFIRSTNAME";
const String PREFS_KEY_USERLASTNAME = "PREFS_KEY_USERLASTNAME";

const String PREFS_KEY_ADDRESSID = "PREFS_KEY_ADDRESSID";
const String PREFS_KEY_PAYMENTTYPE = "PREFS_KEY_PAYMENTTYPE";
const String PREFS_KEY_ORDERID = "PREFS_KEY_ORDERID";
const String PREFS_KEY_PAYMENT_METHOD_ID = "PREFS_KEY_PAYMENT_METHOD_ID";
const String PREFS_KEY_SHIPMENT_ID = "PREFS_KEY_SHIPMENT_ID";

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

  void setAddressId(int addressId) {
    _sharedPreferences.setInt(PREFS_KEY_ADDRESSID, addressId);
  }

  int getAddressId() {
    return _sharedPreferences.getInt(PREFS_KEY_ADDRESSID) ?? 0;
  }

  void setPaymentType(String paymentAppId) {
    _sharedPreferences.setString(PREFS_KEY_PAYMENTTYPE, paymentAppId);
  }

  String getPaymentType() {
    return _sharedPreferences.getString(PREFS_KEY_PAYMENTTYPE) ?? "";
  }

  void setOrderId(String paymentAppId) {
    _sharedPreferences.setString(PREFS_KEY_ORDERID, paymentAppId);
  }

  String getOrderId() {
    return _sharedPreferences.getString(PREFS_KEY_ORDERID) ?? "";
  }

  void setPaymentId(int paymentMethodId) {
    _sharedPreferences.setInt(PREFS_KEY_PAYMENT_METHOD_ID, paymentMethodId);
  }

  int getPaymentId() {
    return _sharedPreferences.getInt(PREFS_KEY_PAYMENT_METHOD_ID) ?? 0;
  }

  void setShipmentId(String value) {
    _sharedPreferences.setString(PREFS_KEY_SHIPMENT_ID, value);
  }

  String getShipmentId() {
    return _sharedPreferences.getString(PREFS_KEY_SHIPMENT_ID) ?? "";
  }
}
