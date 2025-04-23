import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "phoneNumberTwo")
  String? phoneNumberTwo;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "dob")
  DateTime? dob;
  @JsonKey(name: "isTermAndConditionAccept")
  bool? isTermAndConditionAccept;
  @JsonKey(name: "photo")
  String? photo;
  @JsonKey(name: "photoUrl")
  String? photoUrl;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "pincode")
  String? pincode;
  @JsonKey(name: "isSuperAdmin")
  bool? isSuperAdmin;
  @JsonKey(name: "isSingleOrganisation")
  bool? isSingleOrganisation;

  UserResponse(
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

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class ShippingAddressResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "fullName")
  String? fullName;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "pincode")
  String? pincode;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "addressLineOne")
  String? addressLineOne;
  @JsonKey(name: "addressLineTwo")
  String? addressLineTwo;
  @JsonKey(name: "typeOfAddress")
  String? typeOfAddress;
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "isDefault")
  bool? isDefault;
  @JsonKey(name: "isDeliveryAvailable")
  bool? isDeliveryAvailable;

  ShippingAddressResponse(
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
      this.isDeliveryAvailable);

  factory ShippingAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressResponseToJson(this);
}

@JsonSerializable()
class ShippingsChargeResponse {
  @JsonKey(name: "integrationId")
  int? integrationId;
  @JsonKey(name: "integrationName")
  String? integrationName;
  @JsonKey(name: "deliveryCharge")
  double? deliveryCharge;
  @JsonKey(name: "deliveryTime")
  String? deliveryTime;
  @JsonKey(name: "serviceCode")
  String? serviceCode;

  ShippingsChargeResponse(this.integrationId, this.integrationName,
      this.deliveryCharge, this.deliveryTime, this.serviceCode);

  factory ShippingsChargeResponse.fromJson(Map<String, dynamic> json) =>
      _$ShippingsChargeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingsChargeResponseToJson(this);
}

@JsonSerializable()
class StatesResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "value")
  String? value;

  StatesResponse(this.name, this.value);

  factory StatesResponse.fromJson(Map<String, dynamic> json) =>
      _$StatesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatesResponseToJson(this);
}

@JsonSerializable()
class PaymentMethodResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "area")
  String? area;
  @JsonKey(name: "isActive")
  bool? isActive;
  @JsonKey(name: "inProcess")
  bool? inProcess;
  @JsonKey(name: "failed")
  bool? failed;
  @JsonKey(name: "flowType")
  String? flowType;

  PaymentMethodResponse(this.id, this.name, this.type, this.area, this.isActive,
      this.inProcess, this.failed, this.flowType);

  factory PaymentMethodResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodResponseToJson(this);
}
