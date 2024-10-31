class ForgetPasswordData {
  int? resetCode;

  ForgetPasswordData({this.resetCode});

  factory ForgetPasswordData.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordData(
        resetCode: json['reset_code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'reset_code': resetCode,
      };
}
