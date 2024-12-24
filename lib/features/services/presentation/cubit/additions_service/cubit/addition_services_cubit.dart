import 'dart:core';
import 'package:best_touch_training/features/services/data/models/additions_model/addtions_services_model/addition_model.dart';
import 'package:best_touch_training/features/services/data/models/order_request_body.dart';
import 'package:best_touch_training/features/services/data/repository/services_repository.dart';
import 'package:best_touch_training/features/services/presentation/screens/widgets/service_item.dart';
import 'package:bloc/bloc.dart';
part 'addition_services_state.dart';

class AdditionServicesCubit extends Cubit<AdditionServicesState> {
  AdditionServicesCubit(
    this.servicesRepo,
  ) : super(AdditionServicesInitial());
  final ServicesRepository servicesRepo;
  ContentParams? contentParams;
  AdditionModel? additionModel;
  List<AdditionModel> additionsList = [];
  Future<void> getAdditionsServices({
    required int serviceId,
    required int washerId,
    required int sizeId,
  }) async {
    emit(AdditionServicesLoading());
    final result = await servicesRepo.getAdditionsServices(
      serviceId: serviceId,
      washerId: washerId,
      sizeId: sizeId,
    );
    result.fold(
      (failure) {
        emit(AdditionServicesError(message: failure));
      },
      (right) {
        additionsList = right.additions ?? [];
        emit(AdditionServicesSuccess(additions: additionsList));
      },
    );
  }

  List<AdditionModel> checkList = [];
  List<int> selectedIndex = [];
  double additionPrice = 0.0;
  double totalPrice = 0.0;
  void toggleCheckBox(
      {required bool isSelected,
      required int index,
      required double price,
      required double servicePrice,
      required AdditionModel additonModel}) {
    if (isSelected == true) {
      checkList.add(additonModel);
      selectedIndex.add(index);
      additionPrice += servicePrice;

      totalPrice = additionPrice + price;

      emit(ToggleSuccessState());
    } else {
      checkList.remove(additonModel);
      selectedIndex.remove(index);
      additionPrice -= servicePrice;
      totalPrice = price + additionPrice;
      emit(ToggleSuccessState());
    }
  }

  Future<void> confirmationOrder({required OrderBody orderBody}) async {
    emit(OrdersConfirmationLoading());
    final result = await servicesRepo.orderConfirmation(orderBody);
    result.fold(
      (failure) {
        emit(OrdersConfirmationError(message: failure));
      },
      (right) {
        emit(OrdersConfirmationSuccess());
      },
    );
  }
}
