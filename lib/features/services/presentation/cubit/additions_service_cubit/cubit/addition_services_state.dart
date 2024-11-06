part of 'addition_services_cubit.dart';

sealed class AdditionServicesState {}

final class AdditionServicesInitial extends AdditionServicesState {}

final class AdditionServicesLoading extends AdditionServicesState {}

final class AdditionServicesSuccess extends AdditionServicesState {
  final List<AdditionModel> additions;

  AdditionServicesSuccess({required this.additions});
}

final class AdditionServicesError extends AdditionServicesState {
  final String message;

  AdditionServicesError({required this.message});
}
final class ToggleSuccessState extends AdditionServicesState {}
