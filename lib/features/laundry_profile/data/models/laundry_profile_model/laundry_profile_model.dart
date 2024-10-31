import 'laundry_details.dart';

class LaundryProfileModel {
  bool? success;
  LaundryDetails? laundryDetails;
  String? message;

  LaundryProfileModel({this.success, this.laundryDetails, this.message});

  factory LaundryProfileModel.fromJson(Map<String, dynamic> json) {
    return LaundryProfileModel(
      success: json['success'] as bool?,
      laundryDetails: json['data'] == null
          ? null
          : LaundryDetails.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': laundryDetails?.toJson(),
        'message': message,
      };
}
