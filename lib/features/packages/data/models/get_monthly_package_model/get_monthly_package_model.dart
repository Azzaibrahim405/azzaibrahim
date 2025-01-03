import 'data.dart';

class GetMonthlyPackageModel {
  bool? success;
  Data? data;
  String? message;

  GetMonthlyPackageModel({this.success, this.data, this.message});

  factory GetMonthlyPackageModel.fromJson(Map<String, dynamic> json) {
    return GetMonthlyPackageModel(
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
