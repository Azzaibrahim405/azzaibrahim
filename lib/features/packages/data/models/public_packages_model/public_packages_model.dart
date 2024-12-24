import 'data.dart';

class PublicPackagesModel {
  bool? success;
  Data? data;
  String? message;

  PublicPackagesModel({this.success, this.data, this.message});

  factory PublicPackagesModel.fromJson(Map<String, dynamic> json) {
    return PublicPackagesModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
