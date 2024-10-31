import 'services.dart';

class GetServiceModel {
  bool? success;
  Services? services;
  String? message;

  GetServiceModel({this.success, this.services, this.message});

  factory GetServiceModel.fromJson(Map<String, dynamic> json) {
    return GetServiceModel(
      success: json['success'] as bool?,
      services: json['data'] == null
          ? null
          : Services.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': services?.toJson(),
        'message': message,
      };
}
