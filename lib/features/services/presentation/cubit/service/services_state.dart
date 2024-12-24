part of 'services_cubit.dart';

sealed class ServicesState {}

final class ServicesInitial extends ServicesState {}

final class ServicesLoadingState extends ServicesState {}

final class ServicesSuccessState extends ServicesState {
  final List<ServiceItemModel> servicesList;

  ServicesSuccessState({required this.servicesList});
}

final class ServicesErrorState extends ServicesState {
  final String message;

  ServicesErrorState({required this.message});
}
