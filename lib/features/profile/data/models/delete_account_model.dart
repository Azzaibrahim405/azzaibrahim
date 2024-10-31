class DeleteAccountModel {
  bool? success;
  String? message;

  DeleteAccountModel({this.success, this.message});

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
