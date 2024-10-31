part of 'laundry_profile_cubit.dart';

@immutable
sealed class LaundryProfileState {}

final class LaundryProfileInitial extends LaundryProfileState {}

final class LaundryProfileLoadingState extends LaundryProfileState {}

final class LaundryProfileSuccessState extends LaundryProfileState {
  LaundryDetails laundryDetails;
  LaundryProfileSuccessState(
    this.laundryDetails,
  );
}

final class LaundryProfileErrorState extends LaundryProfileState {
  final String message;

  LaundryProfileErrorState({required this.message});
}
