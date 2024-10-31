class ErrorModel {
  final bool status;
  final String message;

  ErrorModel({required this.status, required this.message});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      status: jsonData['success'],
      message: jsonData['message'],
    );
  }
}
