import 'package:best_touch_training/core/database/remote/api_keys.dart';

class UpdateProfileRequest {
  String name;
  String? avatar;
  String email;
  String? oldPassword;
  String? newPassword;
  String? confirmNewPassword;
  UpdateProfileRequest(
      {this.avatar,
      required this.email,
      required this.name,
      this.oldPassword,
      this.newPassword,
      this.confirmNewPassword});
  Map<String, dynamic> toJson() => {
        if (avatar != null) ...{
          ApiKeys.avatar: avatar,
        },
        ApiKeys.email: email,
        ApiKeys.name: name,
        if (oldPassword != null && oldPassword!.isNotEmpty) ...{
          ApiKeys.oldPassword: oldPassword,
        },
        if (newPassword != null && newPassword!.isNotEmpty) ...{
          ApiKeys.newPassword: newPassword,
        },
        if (confirmNewPassword != null && confirmNewPassword!.isNotEmpty) ...{
          ApiKeys.confirmNewPass: confirmNewPassword
        }
      };
}
