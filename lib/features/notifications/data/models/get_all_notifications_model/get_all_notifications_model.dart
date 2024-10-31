import 'notifications_list_model.dart';

class GetAllNotificationsModel {
  bool? success;
  NotificationsListModel? notificationsListModel;
  String? message;

  GetAllNotificationsModel(
      {this.success, this.notificationsListModel, this.message});

  factory GetAllNotificationsModel.fromJson(Map<String, dynamic> json) {
    return GetAllNotificationsModel(
      success: json['success'] as bool?,
      notificationsListModel: json['data'] == null
          ? null
          : NotificationsListModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': notificationsListModel?.toJson(),
        'message': message,
      };
}
