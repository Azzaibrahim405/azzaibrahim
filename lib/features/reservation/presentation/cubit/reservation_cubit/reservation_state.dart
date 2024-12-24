part of 'reservation_cubit.dart';

sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

final class ReservationLoading extends ReservationState {}

final class ReservationSuccess extends ReservationState {
  final List<OrderItem> orders;

  ReservationSuccess({required this.orders});
}

final class ReservationError extends ReservationState {
  final String message;

  ReservationError({required this.message});
}
