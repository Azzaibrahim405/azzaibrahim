import 'data.dart';

class ForgetPasswordModel {
  bool? success;
  ForgetPasswordData? forgetPasswordData;
  String? message;

  ForgetPasswordModel({this.success, this.forgetPasswordData, this.message});

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      success: json['success'] as bool?,
      forgetPasswordData: json['data'] == null
          ? null
          : ForgetPasswordData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': forgetPasswordData?.toJson(),
        'message': message,
      };
}
