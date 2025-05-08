import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/network/failure.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/domain/model/auth_model.dart';
import 'package:k_distribution/domain/repository/auth_repository.dart';
import 'package:k_distribution/domain/usecase/base_usecase.dart';

class LoginUseCase extends BaseUseCase<LoginUsecaseInput, Authentication> {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUsecaseInput input) async {
    return await _authRepository
        .login(LoginRequest(input.phoneNumber, input.email, input.password));
  }
}

class LoginUsecaseInput {
  String phoneNumber;
  String email;
  String password;

  LoginUsecaseInput(this.phoneNumber, this.email, this.password);
}

class LoginWithQrUseCase
    extends BaseUseCase<LoginWithQrUseCaseInput, Authentication> {
  final AuthRepository _authRepository;
  LoginWithQrUseCase(this._authRepository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginWithQrUseCaseInput input) async {
    return await _authRepository.loginWithQrCode(input.qrCode);
  }
}

class LoginWithQrUseCaseInput {
  String qrCode;
  LoginWithQrUseCaseInput(this.qrCode);
}
