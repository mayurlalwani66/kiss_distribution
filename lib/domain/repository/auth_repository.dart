import 'package:dartz/dartz.dart';
import 'package:k_distribution/domain/model/auth_model.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';

abstract class AuthRepository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
