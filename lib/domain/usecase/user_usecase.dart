import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/network/failure.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/data/responses/user_response/user_response.dart';
import 'package:k_distribution/domain/repository/user_repository.dart';
import 'package:k_distribution/domain/usecase/base_usecase.dart';

import '../model/user_model.dart';

class UserUseCase extends BaseUseCase<String, User> {
  final UserRepository _userRepository;
  UserUseCase(this._userRepository);

  @override
  Future<Either<Failure, User>> execute(String input) async {
    return await _userRepository.getUserData();
  }
}

class AddressUseCase extends BaseUseCase<void, List<ShippingAddress>> {
  final UserRepository _userRepository;

  AddressUseCase(this._userRepository);

  @override
  Future<Either<Failure, List<ShippingAddress>>> execute(void input) async {
    return await _userRepository.getAllAddresses();
  }
}

class ShippingChargeUseCase
    extends BaseUseCase<ShippingChargeInput, List<ShippingCharge>> {
  final UserRepository _userRepository;
  ShippingChargeUseCase(this._userRepository);
  @override
  Future<Either<Failure, List<ShippingCharge>>> execute(
      ShippingChargeInput input) async {
    return await _userRepository.getShippingCharges(
        ShippingChargeRequest(input.weight, input.amount, input.addressId));
  }
}

class ShippingChargeInput {
  double weight;
  double amount;
  int addressId;

  ShippingChargeInput(this.weight, this.amount, this.addressId);
}

class DynamicFormUseCase
    extends BaseUseCase<DynamicFormUseCaseInput, List<SettingValue>> {
  final UserRepository _userRepository;
  DynamicFormUseCase(this._userRepository);
  @override
  Future<Either<Failure, List<SettingValue>>> execute(
      DynamicFormUseCaseInput input) async {
    return await _userRepository
        .getDynamicFormDataByControlKeys(DynamicFormRequest(input.controlKeys));
  }
}

class DynamicFormUseCaseInput {
  List<String> controlKeys;

  DynamicFormUseCaseInput(this.controlKeys);
}

class StatesUseCase extends BaseUseCase<String, List<States>> {
  final UserRepository _userRepository;
  StatesUseCase(this._userRepository);
  @override
  Future<Either<Failure, List<States>>> execute(String input) async {
    return await _userRepository.getAllStates(input);
  }
}

class AddShippingAddressUseCase
    extends BaseUseCase<AddShippingAddressInput, ShippingAddress> {
  final UserRepository _userRepository;
  AddShippingAddressUseCase(this._userRepository);
  @override
  Future<Either<Failure, ShippingAddress>> execute(
      AddShippingAddressInput input) async {
    return await _userRepository.addUserShippingAddress(ShippingAddress(
        null,
        input.fullName,
        input.phoneNumber,
        input.pincode,
        input.state,
        null,
        input.addressLineOne,
        input.addressLineTwo,
        input.typeOfAddress,
        input.userId,
        input.isDefault,
        input.isDeliveryAvailable));
  }
}

class AddShippingAddressInput {
  String fullName;
  String phoneNumber;
  String pincode;
  String state;
  String addressLineOne;
  String addressLineTwo;
  String typeOfAddress;
  int userId;
  bool isDefault;
  bool isDeliveryAvailable;
  AddShippingAddressInput(
    this.fullName,
    this.phoneNumber,
    this.pincode,
    this.state,
    this.addressLineOne,
    this.addressLineTwo,
    this.typeOfAddress,
    this.userId,
    this.isDefault,
    this.isDeliveryAvailable,
  );
}

class MarkAsDefaultUseCase extends BaseUseCase<int, int> {
  final UserRepository _userRepository;
  MarkAsDefaultUseCase(this._userRepository);
  @override
  Future<Either<Failure, int>> execute(int input) async {
    return await _userRepository.markAsDefaultApi(input);
  }
}

class PaymentMethodUseCase extends BaseUseCase<String, List<PaymentMethod>> {
  final UserRepository _userRepository;
  PaymentMethodUseCase(this._userRepository);
  @override
  Future<Either<Failure, List<PaymentMethod>>> execute(String input) async {
    return await _userRepository.getAllPaymentMethod(input);
  }
}

class UpdateUserUseCase extends BaseUseCase<UpdateUserUseCaseInput, User> {
  final UserRepository _userRepository;

  UpdateUserUseCase(this._userRepository);
  @override
  Future<Either<Failure, User>> execute(UpdateUserUseCaseInput input) async {
    return await _userRepository.updateUserProfile(UserResponse(
        input.id,
        input.userName,
        input.firstName,
        input.lastName,
        input.email,
        input.password,
        input.phoneNumber,
        input.phoneNumberTwo,
        input.role,
        input.dob,
        input.isTermAndConditionAccept,
        input.photo,
        input.photoUrl,
        input.state,
        input.pincode,
        input.isSuperAdmin,
        input.isSingleOrganisation));
  }
}

class UpdateUserUseCaseInput {
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

  UpdateUserUseCaseInput(
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

class DeleteShippingAddressUseCase
    extends BaseUseCase<DeleteShippingAddressUseCaseInput, String> {
  final UserRepository _userRepository;
  DeleteShippingAddressUseCase(this._userRepository);
  @override
  Future<Either<Failure, String>> execute(
      DeleteShippingAddressUseCaseInput input) async {
    return await _userRepository.deleteShippingAddress(
        DeleteUserShippingAddress(input.addressId, input.userId));
  }
}

class DeleteShippingAddressUseCaseInput {
  int addressId;
  int userId;

  DeleteShippingAddressUseCaseInput(this.addressId, this.userId);
}

class UpdateShippingAddressUseCase
    extends BaseUseCase<UpdateShippingAddressUseCaseInput, ShippingAddress> {
  final UserRepository _userRepository;
  UpdateShippingAddressUseCase(this._userRepository);
  @override
  Future<Either<Failure, ShippingAddress>> execute(
      UpdateShippingAddressUseCaseInput input) async {
    return await _userRepository.updateUserShippingAddress(
        input.addressId,
        ShippingAddress(
            input.id,
            input.fullName,
            input.phoneNumber,
            input.pincode,
            input.state,
            null,
            input.addressLineOne,
            input.addressLineTwo,
            input.typeOfAddress,
            input.userId,
            input.isDefault,
            input.isDeliveryAvailable));
  }
}

class UpdateShippingAddressUseCaseInput {
  String addressId;
  int id;
  String fullName;
  String phoneNumber;
  String pincode;
  String state;
  String addressLineOne;
  String addressLineTwo;
  String typeOfAddress;
  int userId;
  bool isDefault;
  bool isDeliveryAvailable;
  UpdateShippingAddressUseCaseInput(
      this.addressId,
      this.id,
      this.fullName,
      this.phoneNumber,
      this.pincode,
      this.state,
      this.addressLineOne,
      this.addressLineTwo,
      this.typeOfAddress,
      this.userId,
      this.isDefault,
      this.isDeliveryAvailable);
}
