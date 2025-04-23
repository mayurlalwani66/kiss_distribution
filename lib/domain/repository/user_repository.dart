import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';
import '../../data/responses/user_response/user_response.dart';
import '../model/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUserData();
  Future<Either<Failure, List<ShippingAddress>>> getAllAddresses();
  Future<Either<Failure, List<ShippingCharge>>> getShippingCharges(
      ShippingChargeRequest shippingChargeRequest);
  Future<Either<Failure, List<SettingValue>>> getDynamicFormDataByControlKeys(
      DynamicFormRequest dynamicFormRequest);

  Future<Either<Failure, List<States>>> getAllStates(String country);
  Future<Either<Failure, ShippingAddress>> addUserShippingAddress(
      ShippingAddress shippingAddress);
  Future<Either<Failure, int>> markAsDefaultApi(int id);
  Future<Either<Failure, List<PaymentMethod>>> getAllPaymentMethod(String area);

  Future<Either<Failure, User>> updateUserProfile(UserResponse request);
  Future<Either<Failure, String>> deleteShippingAddress(
      DeleteUserShippingAddress request);

  Future<Either<Failure, ShippingAddress>> updateUserShippingAddress(
      String addressId, ShippingAddress shippingAddress);
}
