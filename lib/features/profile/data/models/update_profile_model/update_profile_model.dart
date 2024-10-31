import 'update_profile_data.dart';

class UpdateProfileModel {
  bool? success;
  UpdateProfileData? updateProfileData;
  String? message;

  UpdateProfileModel({this.success, this.updateProfileData, this.message});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      success: json['success'] as bool?,
      updateProfileData: json['data'] == null
          ? null
          : UpdateProfileData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': updateProfileData?.toJson(),
        'message': message,
      };
}
