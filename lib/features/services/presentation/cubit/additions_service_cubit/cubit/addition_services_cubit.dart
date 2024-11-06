import 'dart:core';
import 'package:best_touch_training/features/services/data/models/additions_model/addtions_services_model/addition_model.dart';
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

  List<int> selectedIndex = [];
  double additionPrice = 0.0;
  double totalPrice = 0.0;

  void toggleCheckBox(
      {required bool isSelected,
      required int index,
      required double price,
      required double servicePrice}) {
    if (isSelected == true) {
      selectedIndex.add(index);
      additionPrice += servicePrice;

      totalPrice = additionPrice + price;
      emit(ToggleSuccessState());
    } else {
      selectedIndex.remove(index);
      additionPrice -= servicePrice;
      totalPrice = price + additionPrice;
      emit(ToggleSuccessState());
    }
  }
}


//   List<int> selectedIndexes = [];
//   double priceAddition = 0.0;
//   double totalPrice = 0.0;
//   void toggleCheckBoxServices(
//       {required int index,
//       required double servicesPrice,
//       required double price,
//       required bool isSelected}) {
//     if (isSelected == true) {
//       selectedIndexes.add(index);
//       priceAddition += servicesPrice.toDouble();
//       totalPrice = price.toDouble() + priceAddition;
//       emit(toggleSuccess());
//     } else {
//       selectedIndexes.remove(index);
//       priceAddition -= servicesPrice.toDouble();
//       totalPrice = price.toDouble() + priceAddition;
//       emit(toggleSuccess());
//     }
// }
