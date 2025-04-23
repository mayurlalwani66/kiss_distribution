import 'package:k_distribution/domain/model/user_model.dart';

class Authentication {
  String token;
  User? user;

  Authentication(this.token, this.user);
}
