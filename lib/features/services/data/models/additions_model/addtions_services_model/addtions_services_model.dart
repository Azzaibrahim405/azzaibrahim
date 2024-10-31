import 'addition_model.dart';

class AddtionsServicesModel {
  bool? success;
  List<AdditionModel>? additions;
  String? message;

  AddtionsServicesModel({this.success, this.additions, this.message});

  factory AddtionsServicesModel.fromJson(Map<String, dynamic> json) {
    return AddtionsServicesModel(
      success: json['success'] as bool?,
      additions: (json['data'] as List<dynamic>?)
          ?.map((e) => AdditionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': additions?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
