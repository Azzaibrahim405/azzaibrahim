import 'dart:developer';

import 'package:best_touch_training/features/services/data/models/additions_model/addtions_services_model/addition_model.dart';
import 'package:best_touch_training/features/services/data/repository/services_repository.dart';
import 'package:bloc/bloc.dart';
part 'addition_services_state.dart';

class AdditionServicesCubit extends Cubit<AdditionServicesState> {
  AdditionServicesCubit(this.servicesRepo) : super(AdditionServicesInitial());
  final ServicesRepository servicesRepo;
 
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






 List<AdditionModel> additionsList = [];
  List<int> selectedIds = [];
  List<AdditionModel> get paidAdditionalList {
    return additionsList.where((element) => element.isFree == false).toList();
  }

  bool isSelectedId({required int? additionId}) {
    return selectedIds.indexWhere((element) => element == additionId) >= 0;
  }

  List<AdditionModel> get selectedPaidAdditionsList {
  return  paidAdditionalList
        .where((element) => isSelectedId(additionId: element.id))
        .toList();
  }

  void toggleCheckbox(int? additionId) {
    final isSelected = isSelectedId(additionId: additionId ?? 0);

    log(isSelected.toString());
    if (!isSelected) {
      selectedIds.add(additionId ?? 0);
    } else {
      selectedIds.removeWhere((element) => element == additionId);
    }
    emit(ServiceCheckBox());
  }

  double get totalSelectedPaidAdditions {
    var total = 0.0;
    for (var i = 0; i < selectedIds.length; i++) {
      final paidAdditionIndex = paidAdditionalList
          .indexWhere((element) => element.id == selectedIds[i]);
      if (paidAdditionIndex >= 0) {
        total += (paidAdditionalList[paidAdditionIndex].price ?? 0);
      }
    }
    return total;
  }
}
