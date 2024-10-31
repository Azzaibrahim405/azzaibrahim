import 'register_data.dart';

class RegisterModel {
  bool? success;
  RegisterData? registerData;
  String? message;

  RegisterModel({this.success, this.registerData, this.message});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        success: json['success'] as bool?,
        registerData: json['data'] == null
            ? null
            : RegisterData.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': registerData?.toJson(),
        'message': message,
      };
}
