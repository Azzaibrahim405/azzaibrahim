import 'reset_password_data.dart';

class NewPasswordModel {
  bool? success;
  ResetPasswordData? resetPasswordData;
  String? message;

  NewPasswordModel({this.success, this.resetPasswordData, this.message});

  factory NewPasswordModel.fromJson(Map<String, dynamic> json) {
    return NewPasswordModel(
      success: json['success'] as bool?,
      resetPasswordData: json['data'] == null
          ? null
          : ResetPasswordData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': resetPasswordData?.toJson(),
        'message': message,
      };
}
