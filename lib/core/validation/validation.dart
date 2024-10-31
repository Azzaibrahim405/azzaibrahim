class ValidationHelper {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
  );
  static validate(value) {
    if (value.isEmpty) {
      return "field is required";
    }
  }

  emailValidation(value) {
    if (value == null || value.isEmpty) {
      return "value is required";
    } else if (emailRegex.hasMatch(value)) {
      return "please enter avalid email address";
    }
    return null;
  }

  static String pinCodeValidat(String value) {
    if (value.isEmpty) {
      return "field is required";
    } else if (value.length < 4) {
      return "The verification code must be at least 4 numbers";
    }
    return '';
  }

  confirmPasswordValidation(value) {}
}
