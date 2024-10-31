import 'data.dart';

class LoyalityModel {
  bool? success;
  Data? data;
  String? message;

  LoyalityModel({this.success, this.data, this.message});

  factory LoyalityModel.fromJson(Map<String, dynamic> json) => LoyalityModel(
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
