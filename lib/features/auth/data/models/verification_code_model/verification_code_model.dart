import 'verification_code_data.dart';

class VerificationCodeModel {
  bool? success;
  VerificationCodeData? data;
  String? message;

  VerificationCodeModel({this.success, this.data, this.message});

  factory VerificationCodeModel.fromJson(Map<String, dynamic> json) {
    return VerificationCodeModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : VerificationCodeData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
