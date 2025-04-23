import '../../domain/model/user_model.dart';
import 'package:k_distribution/app/extension.dart';

import '../responses/base_response/base_response.dart';
import '../responses/user_response/user_response.dart';
import 'auth_mapper.dart';

extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
        this?.id.orZero() ?? ZERO,
        this?.userName.orEmpty() ?? EMPTY,
        this?.firstName.orEmpty() ?? EMPTY,
        this?.lastName.orEmpty() ?? EMPTY,
        this?.email.orEmpty() ?? EMPTY,
        this?.password.orEmpty() ?? EMPTY,
        this?.phoneNumber.orEmpty() ?? EMPTY,
        this?.phoneNumberTwo.orEmpty() ?? EMPTY,
        this?.role.orEmpty() ?? EMPTY,
        this?.dob.orDate() ?? DATE,
        this?.isTermAndConditionAccept.orFalse() ?? FALSE,
        this?.photo.orEmpty() ?? EMPTY,
        this?.photoUrl.orEmpty() ?? EMPTY,
        this?.state.orEmpty() ?? EMPTY,
        this?.pincode.orEmpty() ?? EMPTY,
        this?.isSuperAdmin.orFalse() ?? FALSE,
        this?.isSingleOrganisation.orFalse() ?? FALSE);
  }
}

extension ShippingAddressResponseMapper on ShippingAddressResponse? {
  ShippingAddress toDomain() {
    return ShippingAddress(
      this?.id.orZero() ?? ZERO,
      this?.fullName.orEmpty() ?? EMPTY,
      this?.phoneNumber.orEmpty() ?? EMPTY,
      this?.pincode.orEmpty() ?? EMPTY,
      this?.state.orEmpty() ?? EMPTY,
      this?.city.orEmpty() ?? EMPTY,
      this?.addressLineOne.orEmpty() ?? EMPTY,
      this?.addressLineTwo.orEmpty() ?? EMPTY,
      this?.typeOfAddress.orEmpty() ?? EMPTY,
      this?.userId.orZero() ?? ZERO,
      this?.isDefault.orFalse() ?? FALSE,
      this?.isDeliveryAvailable.orFalse() ?? FALSE,
    );
  }
}

extension ShippingsChargeResponseMapper on ShippingsChargeResponse? {
  ShippingCharge toDomain() {
    return ShippingCharge(
      this?.integrationId.orZero() ?? ZERO,
      this?.integrationName.orEmpty() ?? EMPTY,
      this?.deliveryCharge.orZeroPointZero() ?? ZEROPOINTZERO,
      this?.deliveryTime.orEmpty() ?? EMPTY,
      this?.serviceCode.orEmpty() ?? EMPTY,
    );
  }
}

extension SettingValueResponseMapper on SettingValueResponse? {
  SettingValue toDomain() {
    return SettingValue(
        this?.controlKey.orEmpty() ?? EMPTY,
        this?.value.orEmpty() ?? EMPTY,
        this?.valueType?.name.orEmpty() ?? EMPTY);
  }
}

extension StatesResponseMapper on StatesResponse? {
  States toDomain() {
    return States(
        this?.name.orEmpty() ?? EMPTY, this?.value.orEmpty() ?? EMPTY);
  }
}

extension PaymentMethodResponseMapper on PaymentMethodResponse? {
  PaymentMethod toDomain() {
    return PaymentMethod(this?.id.orZero() ?? ZERO,
        this?.type.orEmpty() ?? EMPTY, this?.area.orEmpty() ?? EMPTY);
  }
}

// to Response for passing data to shipping address to shipping addressresponse
extension ShippingAddressMapper on ShippingAddress? {
  ShippingAddressResponse toResponse() {
    return ShippingAddressResponse(
        this?.id,
        this?.fullName,
        this?.phoneNumber,
        this?.pincode,
        this?.state,
        this?.city,
        this?.addressLineOne,
        this?.addressLineTwo,
        this?.typeOfAddress,
        this?.userId,
        this?.isDefault,
        this?.isDeliveryAvailable);
  }
}
