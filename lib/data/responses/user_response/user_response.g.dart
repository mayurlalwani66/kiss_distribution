// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      (json['id'] as num?)?.toInt(),
      json['userName'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['phoneNumber'] as String?,
      json['phoneNumberTwo'] as String?,
      json['role'] as String?,
      json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      json['isTermAndConditionAccept'] as bool?,
      json['photo'] as String?,
      json['photoUrl'] as String?,
      json['state'] as String?,
      json['pincode'] as String?,
      json['isSuperAdmin'] as bool?,
      json['isSingleOrganisation'] as bool?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberTwo': instance.phoneNumberTwo,
      'role': instance.role,
      'dob': instance.dob?.toIso8601String(),
      'isTermAndConditionAccept': instance.isTermAndConditionAccept,
      'photo': instance.photo,
      'photoUrl': instance.photoUrl,
      'state': instance.state,
      'pincode': instance.pincode,
      'isSuperAdmin': instance.isSuperAdmin,
      'isSingleOrganisation': instance.isSingleOrganisation,
    };

ShippingAddressResponse _$ShippingAddressResponseFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressResponse(
      (json['id'] as num?)?.toInt(),
      json['fullName'] as String?,
      json['phoneNumber'] as String?,
      json['pincode'] as String?,
      json['state'] as String?,
      json['city'] as String?,
      json['addressLineOne'] as String?,
      json['addressLineTwo'] as String?,
      json['typeOfAddress'] as String?,
      (json['userId'] as num?)?.toInt(),
      json['isDefault'] as bool?,
      json['isDeliveryAvailable'] as bool?,
    );

Map<String, dynamic> _$ShippingAddressResponseToJson(
        ShippingAddressResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'pincode': instance.pincode,
      'state': instance.state,
      'city': instance.city,
      'addressLineOne': instance.addressLineOne,
      'addressLineTwo': instance.addressLineTwo,
      'typeOfAddress': instance.typeOfAddress,
      'userId': instance.userId,
      'isDefault': instance.isDefault,
      'isDeliveryAvailable': instance.isDeliveryAvailable,
    };

ShippingsChargeResponse _$ShippingsChargeResponseFromJson(
        Map<String, dynamic> json) =>
    ShippingsChargeResponse(
      (json['integrationId'] as num?)?.toInt(),
      json['integrationName'] as String?,
      (json['deliveryCharge'] as num?)?.toDouble(),
      json['deliveryTime'] as String?,
      json['serviceCode'] as String?,
    );

Map<String, dynamic> _$ShippingsChargeResponseToJson(
        ShippingsChargeResponse instance) =>
    <String, dynamic>{
      'integrationId': instance.integrationId,
      'integrationName': instance.integrationName,
      'deliveryCharge': instance.deliveryCharge,
      'deliveryTime': instance.deliveryTime,
      'serviceCode': instance.serviceCode,
    };

StatesResponse _$StatesResponseFromJson(Map<String, dynamic> json) =>
    StatesResponse(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$StatesResponseToJson(StatesResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

PaymentMethodResponse _$PaymentMethodResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['type'] as String?,
      json['area'] as String?,
      json['isActive'] as bool?,
      json['inProcess'] as bool?,
      json['failed'] as bool?,
      json['flowType'] as String?,
    );

Map<String, dynamic> _$PaymentMethodResponseToJson(
        PaymentMethodResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'area': instance.area,
      'isActive': instance.isActive,
      'inProcess': instance.inProcess,
      'failed': instance.failed,
      'flowType': instance.flowType,
    };
