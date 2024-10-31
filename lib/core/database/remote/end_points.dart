class EndPoints {
  static const String baseUrl = "https://demo.best-touch.online";
  //auth endpoints
  static const String login = '/api/login';
  static const String forgetPassword = '/api/password/forget';
  static const String verificationFromPassword = '/api/password/code';
  static const String resetPassword = '/api/password/reset';
  static const String register = '/api/register';
  static const String getProfile = '/api/profile';
  static const String deleteAccount = '/api/user/delete';
  //home endpoints
  static const String sliders = '/api/advertisements';
  static const String allWashers = '/api/washers';
  static const String updateProfile = '/api/profile';
  //notifications

  static const String allNotifications = '/api/notifications';
  static String profileLaundry(int? id) => '/api/washers/$id';
  static String getService({required int sizeId, required int washerId}) =>
      '/api/services?size=$sizeId&washer=$washerId';

  static String getAllTypesCars = '/api/sizes';
  static String getAdditionsServives(
          {required int serviceId,
          required int washerId,
          required int sizeId}) =>
      '/api/additions?washer=$washerId&size=$sizeId&service=$serviceId';
}
