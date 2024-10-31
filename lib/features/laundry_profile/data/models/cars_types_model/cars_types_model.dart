import 'car_data.dart';

class CarsTypesModel {
  bool? success;
  List<CarData>? carData;
  String? message;

  CarsTypesModel({this.success, this.carData, this.message});

  factory CarsTypesModel.fromJson(Map<String, dynamic> json) {
    return CarsTypesModel(
      success: json['success'] as bool?,
      carData: (json['data'] as List<dynamic>?)
          ?.map((e) => CarData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': carData?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
