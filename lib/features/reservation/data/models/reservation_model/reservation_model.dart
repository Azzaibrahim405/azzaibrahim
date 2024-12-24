import 'data.dart';

class ReservationModel {
  bool? success;
  Data? data;
  String? message;

  ReservationModel({this.success, this.data, this.message});

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
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
