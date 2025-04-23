import 'package:json_annotation/json_annotation.dart';

import '../user_response/user_response.dart';
part 'auth_responses.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserResponse? user;
  LoginResponse(this.token, this.user);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
