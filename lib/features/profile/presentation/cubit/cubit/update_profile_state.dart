part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoadingState extends UpdateProfileState {}

final class UpdateProfileSuccessState extends UpdateProfileState {}

final class UpdateProfileErrorState extends UpdateProfileState {
  String message;
  UpdateProfileErrorState(this.message);
}

final class DeleteAccountLoadingState extends UpdateProfileState {}

final class DeleteAccountSuccessState extends UpdateProfileState {}

// ignore: must_be_immutable
final class DeleteAccountErrorState extends UpdateProfileState {
  String message;
  DeleteAccountErrorState(this.message);
}
