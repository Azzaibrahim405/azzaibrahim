import 'package:best_touch_training/core/database/remote/api_keys.dart';

class VerificationRerquest {
  String phone;
  String code;
  VerificationRerquest({required this.code, required this.phone});

  Map<String, dynamic> toJson() => {ApiKeys.phone: phone, ApiKeys.code: code};
}
