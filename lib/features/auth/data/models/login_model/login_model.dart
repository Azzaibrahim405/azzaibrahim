import 'user.dart';

class LoginModel {
  bool? success;
  User? user;
  String? message;

  LoginModel({this.success, this.user, this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json['success'] as bool?,
        user: json['data'] == null
            ? null
            : User.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': user?.toJson(),
        'message': message,
      };
}
