import 'slider_data.dart';

class SlidersModel {
  bool? success;
  List<SliderData>? sliderData;
  String? message;

  SlidersModel({this.success, this.sliderData, this.message});

  factory SlidersModel.fromJson(Map<String, dynamic> json) => SlidersModel(
        success: json['success'] as bool?,
        sliderData: (json['data'] as List<dynamic>?)
            ?.map((e) => SliderData.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': sliderData?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
