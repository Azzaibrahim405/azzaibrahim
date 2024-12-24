import 'package:best_touch_training/features/services/data/models/get_service_model/service_item.dart';
import 'package:best_touch_training/features/services/data/repository/services_repository.dart';
import 'package:bloc/bloc.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(this.servicesRepository) : super(ServicesInitial());
  final ServicesRepository servicesRepository;

  List<ServiceItemModel> services = [];
  //ServiceItemModel? serviceItemModel;

  void getServiceWasher({int? sizeId, int? washerId}) async {
    emit(ServicesLoadingState());
    final result = await servicesRepository.getServiceWasher(sizeId, washerId);
    result.fold(
      (failure) {
        emit(ServicesErrorState(message: failure));
      },
      (serviceModel) {
        services = serviceModel.services?.serviceItem ?? [];

        emit(ServicesSuccessState(servicesList: services));
      },
    );
  }
}
