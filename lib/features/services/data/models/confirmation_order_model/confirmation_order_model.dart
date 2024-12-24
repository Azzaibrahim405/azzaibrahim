import 'order.dart';

class ConfirmationOrderModel {
  bool? success;
  Order? order;
  String? message;

  ConfirmationOrderModel({this.success, this.order, this.message});

  factory ConfirmationOrderModel.fromJson(Map<String, dynamic> json) {
    return ConfirmationOrderModel(
      success: json['success'] as bool?,
      order: json['data'] == null
          ? null
          : Order.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': order?.toJson(),
        'message': message,
      };
}
