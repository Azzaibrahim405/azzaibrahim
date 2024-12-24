import 'package:best_touch_training/core/utils/enums.dart';
import 'package:best_touch_training/features/reservation/data/models/reservation_model/order_item.dart';
import 'package:best_touch_training/features/reservation/data/repository/reservation_repository.dart';
import 'package:bloc/bloc.dart';
part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit(this.reservationRepo) : super(ReservationInitial());
  final ReservationRepository reservationRepo;
  void getAllReservations(OrderStatus statuses) async {
    emit(ReservationLoading());
    List<OrderItem> ordersList = [];

    final result =
        await reservationRepo.getAllReservations(status: getStatus(statuses));
    result.fold(
      (left) {
        emit(ReservationError(message: left));
      },
      (right) {
        ordersList = right.data?.ordersList ?? [];
        emit(ReservationSuccess(orders: ordersList));
      },
    );
  }

  getStatus(OrderStatus orderStatus) {
    switch (orderStatus) {
      case OrderStatus.pending:
        return "pending,accepted,inProgress";
      case OrderStatus.completed:
        return "completed,cancelled";
      default:
        "";
    }
  }
}
