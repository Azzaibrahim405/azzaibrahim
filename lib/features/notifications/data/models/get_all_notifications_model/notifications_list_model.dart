import 'notification_item.dart';

class NotificationsListModel {
  List<NotificationItemModel>? data;

  NotificationsListModel({this.data});

  factory NotificationsListModel.fromJson(Map<String, dynamic> json) =>
      NotificationsListModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) =>
                NotificationItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
