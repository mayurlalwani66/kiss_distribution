// to convert the response into a non nullable object (model)

import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/data/mapper/user_mapper.dart';
import 'package:k_distribution/data/responses/auth_response/auth_responses.dart';

import '../../domain/model/auth_model.dart';

const EMPTY = "";
const ZERO = 0;
const ZEROPOINTZERO = 0.0;
const FALSE = false;
final DATE = DateTime.now();

extension LoginResponseMapper on LoginResponse? {
  Authentication toDomain() {
    print(this?.token.toString());
    return Authentication(
      this?.token.orEmpty() ?? EMPTY,
      this?.user?.toDomain(),
    );
  }
}
