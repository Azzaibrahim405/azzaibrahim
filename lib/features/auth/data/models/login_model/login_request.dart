import 'package:best_touch_training/core/database/remote/api_keys.dart';

class LoginRequest {
  String phone;
  String password;
  String? deviceToken;
  LoginRequest({this.deviceToken, required this.password, required this.phone});
  Map<String, dynamic> toJson() => {
        ApiKeys.phone: phone,
        ApiKeys.password: password,
        ApiKeys.deviceToken: 'kkkkkk'
      };
}
