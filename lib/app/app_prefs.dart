import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_USERID = "PREFS_KEY_USERID";
const String PREFS_KEY_USEREMAIL = "PREFS_KEY_USEREMAIL";
const String PREFS_KEY_USERPHONENUMBER = "PREFS_KEY_USERPHONENUMBER";
const String PREFS_KEY_USERPHONENUMBER2 = "PREFS_KEY_USERPHONENUMBER2";
const String PREFS_KEY_USERFIRSTNAME = "PREFS_KEY_USERFIRSTNAME";
const String PREFS_KEY_USERLASTNAME = "PREFS_KEY_USERLASTNAME";
const String PREFS_KEY_USERPASSWORD = "PREFS_KEY_USERPASSWORD";
const String PREFS_KEY_USERNAME = 'PREFS_KEY_USERNAME';
const String PREFS_KEY_USERROLE = 'PREFS_KEY_USERROLE';
const String PREFS_KEY_USERDOB = 'PREFS_KEY_USERDOB';
const String PREFS_KEY_USERIS_TERMS_ACCEPTED =
    'PREFS_KEY_USERIS_TERMS_ACCEPTED';
const String PREFS_KEY_USERPHOTO = 'PREFS_KEY_USERPHOTO';
const String PREFS_KEY_USERPHOTOURL = 'PREFS_KEY_USERPHOTOURL';
const String PREFS_KEY_USERSTATE = 'PREFS_KEY_USERSTATE';
const String PREFS_KEY_USERPINCODE = 'PREFS_KEY_USERPINCODE';
const String PREFS_KEY_USERSUPERADMIN = 'PREFS_KEY_USERSUPERADMIN';
const String PREFS_KEY_USERSINGLEORG = 'PREFS_KEY_USERSINGLEORG';

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

  void setUserPhoneNumber2(String phoneNumber2) {
    _sharedPreferences.setString(PREFS_KEY_USERPHONENUMBER2, phoneNumber2);
  }

  String getUserPhoneNumber2() {
    return _sharedPreferences.getString(PREFS_KEY_USERPHONENUMBER2) ?? "";
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

  void setUserPassword(String password) {
    _sharedPreferences.setString(PREFS_KEY_USERPASSWORD, password);
  }

  String getUserPassword() {
    return _sharedPreferences.getString(PREFS_KEY_USERPASSWORD) ?? "";
  }

  void setUserName(String name) {
    _sharedPreferences.setString(PREFS_KEY_USERNAME, name);
  }

  String getUserName() {
    return _sharedPreferences.getString(PREFS_KEY_USERNAME) ?? "";
  }

  void setUserRole(String role) {
    _sharedPreferences.setString(PREFS_KEY_USERROLE, role);
  }

  String getUserRole() {
    return _sharedPreferences.getString(PREFS_KEY_USERROLE) ?? "";
  }

  void setUserDob(DateTime dob) {
    _sharedPreferences.setString(PREFS_KEY_USERDOB, dob.toIso8601String());
  }

  DateTime? getUserDob() {
    final dobString = _sharedPreferences.getString(PREFS_KEY_USERDOB);
    if (dobString == null || dobString.isEmpty) return null;
    return DateTime.tryParse(dobString);
  }

  void setUserIsTermAndConditionAccept(bool isAccepted) {
    _sharedPreferences.setBool(PREFS_KEY_USERIS_TERMS_ACCEPTED, isAccepted);
  }

  bool getUserIsTermAndConditionAccept() {
    return _sharedPreferences.getBool(PREFS_KEY_USERIS_TERMS_ACCEPTED) ?? false;
  }

  void setUserPhoto(String photo) {
    _sharedPreferences.setString(PREFS_KEY_USERPHOTO, photo);
  }

  String getUserPhoto() {
    return _sharedPreferences.getString(PREFS_KEY_USERPHOTO) ?? "";
  }

  void setUserPhotoUrl(String photoUrl) {
    _sharedPreferences.setString(PREFS_KEY_USERPHOTOURL, photoUrl);
  }

  String getUserPhotoUrl() {
    return _sharedPreferences.getString(PREFS_KEY_USERPHOTOURL) ?? "";
  }

  void setUserState(String state) {
    _sharedPreferences.setString(PREFS_KEY_USERSTATE, state);
  }

  String getUserState() {
    return _sharedPreferences.getString(PREFS_KEY_USERSTATE) ?? "";
  }

  void setUserPincode(String pincode) {
    _sharedPreferences.setString(PREFS_KEY_USERPINCODE, pincode);
  }

  String getUserPincode() {
    return _sharedPreferences.getString(PREFS_KEY_USERPINCODE) ?? "";
  }

  void setUserIsSuperAdmin(bool isSuperAdmin) {
    _sharedPreferences.setBool(PREFS_KEY_USERSUPERADMIN, isSuperAdmin);
  }

  bool getUserIsSuperAdmin() {
    return _sharedPreferences.getBool(PREFS_KEY_USERSUPERADMIN) ?? false;
  }

  void setUserIsSingleOrganisation(bool isSingleOrg) {
    _sharedPreferences.setBool(PREFS_KEY_USERSINGLEORG, isSingleOrg);
  }

  bool getUserIsSingleOrganisation() {
    return _sharedPreferences.getBool(PREFS_KEY_USERSINGLEORG) ?? false;
  }

  void setPaymentType(String paymentAppId) {
    _sharedPreferences.setString(PREFS_KEY_PAYMENTTYPE, paymentAppId);
  }

  String getPaymentType() {
    return _sharedPreferences.getString(PREFS_KEY_PAYMENTTYPE) ?? "";
  }
}
