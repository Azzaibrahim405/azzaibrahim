import 'package:best_touch_training/core/database/remote/api_keys.dart';

class ResetPasswordRequest {
  String resetToken;
  String password;
  String passwordConfirmation;
  ResetPasswordRequest({
    required this.resetToken,
    required this.password,
    required this.passwordConfirmation,
  });
  Map<String, dynamic> toJson() => {
        ApiKeys.resetToken: resetToken,
        ApiKeys.password: password,
        ApiKeys.passwordConfirmation: passwordConfirmation
      };
}
