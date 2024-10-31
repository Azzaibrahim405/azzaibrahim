import 'washers_data_model.dart';

class GetAllWashersModel {
  bool? success;
  WashersDataModel? washersDataModel;
  String? message;

  GetAllWashersModel({this.success, this.washersDataModel, this.message});

  factory GetAllWashersModel.fromJson(Map<String, dynamic> json) {
    return GetAllWashersModel(
      success: json['success'] as bool?,
      washersDataModel: json['data'] == null
          ? null
          : WashersDataModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': washersDataModel?.toJson(),
        'message': message,
      };
}
