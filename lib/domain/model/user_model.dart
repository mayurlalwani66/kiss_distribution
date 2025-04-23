class User {
  int id;
  String userName;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String phoneNumberTwo;
  String role;
  DateTime dob;
  bool isTermAndConditionAccept;
  String photo;
  String photoUrl;
  String state;
  String pincode;
  bool isSuperAdmin;
  bool isSingleOrganisation;

  User(
      this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phoneNumber,
      this.phoneNumberTwo,
      this.role,
      this.dob,
      this.isTermAndConditionAccept,
      this.photo,
      this.photoUrl,
      this.state,
      this.pincode,
      this.isSuperAdmin,
      this.isSingleOrganisation);
}

class ShippingAddress {
  int? id;
  String fullName;
  String phoneNumber;
  String pincode;
  String state;
  String? city;
  String addressLineOne;
  String addressLineTwo;
  String typeOfAddress;
  int userId;
  bool isDefault;
  bool isDeliveryAvailable;

  ShippingAddress(
    this.id,
    this.fullName,
    this.phoneNumber,
    this.pincode,
    this.state,
    this.city,
    this.addressLineOne,
    this.addressLineTwo,
    this.typeOfAddress,
    this.userId,
    this.isDefault,
    this.isDeliveryAvailable,
  );
}

class ShippingCharge {
  int integrationId;
  String integrationName;
  double deliveryCharge;
  String deliveryTime;
  String serviceCode;

  ShippingCharge(this.integrationId, this.integrationName, this.deliveryCharge,
      this.deliveryTime, this.serviceCode);
}

class SettingValue {
  String controlKey;
  String value;
  String valueType;

  SettingValue(this.controlKey, this.value, this.valueType);
}

class States {
  String name;
  String value;
  States(this.name, this.value);
}

class PaymentMethod {
  int id;
  String type;
  String area;

  PaymentMethod(this.id, this.type, this.area);
}

class FormDataStore {
  int shippingAppId = 0;
  int offlinePaymentAppId = 0;

  String addressLevel1 = '';
  String addressLevel2 = '';
  String addressLevel4 = '';
  String postalCode = '';
  String storeName = '';
  String supportPhone = '';
  String supportEmail = '';

  bool canCancelOrder = false;
  bool canCancelOrderItems = false;
}
