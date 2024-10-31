class NotificationItemModel {
  String? id;
  String? title;
  String? message;
  String? type;
  String? targetModel;
  String? targetType;
  String? targetId;
  bool? isRead;
  String? creationTime;
  String? createdAtFormatted;

  NotificationItemModel({
    this.id,
    this.title,
    this.message,
    this.type,
    this.targetModel,
    this.targetType,
    this.targetId,
    this.isRead,
    this.creationTime,
    this.createdAtFormatted,
  });

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) =>
      NotificationItemModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        message: json['message'] as String?,
        type: json['type'] as String?,
        targetModel: json['target_model'] as String?,
        targetType: json['target_type'] as String?,
        targetId: json['target_id'] as String?,
        isRead: json['is_read'] as bool?,
        creationTime: json['creation_time'] as String?,
        createdAtFormatted: json['created_at_formatted'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'message': message,
        'type': type,
        'target_model': targetModel,
        'target_type': targetType,
        'target_id': targetId,
        'is_read': isRead,
        'creation_time': creationTime,
        'created_at_formatted': createdAtFormatted,
      };
}
