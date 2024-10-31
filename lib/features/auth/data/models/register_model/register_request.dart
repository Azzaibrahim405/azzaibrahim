import 'package:best_touch_training/core/database/remote/api_keys.dart';

class RegisterRequest {
  String phone;
  String name;
  String Password;
  String passwordConfirmation;
  String? location;
  double? lat;
  double? long;
  String? deviceToken;
  RegisterRequest({
    required this.Password,
    this.deviceToken,
    this.lat,
    this.location,
    this.long,
    required this.name,
    required this.passwordConfirmation,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        ApiKeys.name: name,
        ApiKeys.password: Password,
        ApiKeys.phone: phone,
        ApiKeys.passwordConfirmation: passwordConfirmation,
        ApiKeys.lat: '23.54',
        ApiKeys.long: '24.8546',
        ApiKeys.location: 'location',
        ApiKeys.deviceToken: 'gggggjkhjbvggggdsdfgrxds',
      };
}
