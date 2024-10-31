part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccesState extends AuthState {}

final class AuthErrorState extends AuthState {
  String message;
  AuthErrorState(this.message);
}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccesState extends AuthState {}

final class RegisterErrorState extends AuthState {
  String message;
  RegisterErrorState(this.message);
}

class ForgetPasswordLoadingState extends AuthState {}

class ForgetPasswordSuccessState extends AuthState {}

class ForgetPasswordErrorState extends AuthState {
  String message;
  ForgetPasswordErrorState(this.message);
}

class VerificationFromPasswordLoadingState extends AuthState {}

class VerificationFromPasswordSuccessState extends AuthState {}

class VerificationFromPasswordErrorState extends AuthState {
  String message;
  VerificationFromPasswordErrorState(this.message);
}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordErrorState extends AuthState {
  String message;
  ResetPasswordErrorState(this.message);
}

class GetProfileLoadingState extends AuthState {}

class GetProfileSuccessState extends AuthState {
  final ProfileData profileData;

  GetProfileSuccessState(this.profileData);
}

class GetProfileErrorState extends AuthState {
  String message;
  GetProfileErrorState(this.message);
}
