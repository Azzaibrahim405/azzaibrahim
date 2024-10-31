import 'profile_data.dart';

class GetProfileModel {
  bool? success;
  ProfileData? profileData;
  String? message;

  GetProfileModel({this.success, this.profileData, this.message});

  factory GetProfileModel.fromJson(Map<String, dynamic> json) {
    return GetProfileModel(
      success: json['success'] as bool?,
      profileData: json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': profileData?.toJson(),
        'message': message,
      };
}
