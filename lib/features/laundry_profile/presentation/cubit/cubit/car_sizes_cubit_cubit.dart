import 'package:best_touch_training/features/laundry_profile/data/models/cars_types_model/car_data.dart';
import 'package:best_touch_training/features/laundry_profile/data/repository/lauandry_details_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'car_sizes_cubit_state.dart';

class CarSizesCubitCubit extends Cubit<CarSizesCubitState> {
  CarSizesCubitCubit(this.laundryProfileRepo) : super(CarSizesCubitInitial());
  final LauandryDetailsRepository laundryProfileRepo;

  List<CarData> cars = [];
  CarData? carSizeData;
  void getAllCarsTypes() async {
    emit(CarsTypesLoadingState());
    final result = await laundryProfileRepo.getAllTypesCars();
    result.fold(
      (failure) {
        emit(CarsTypesErrorState(message: failure));
      },
      (right) {
        cars = right.carData ?? [];

        emit(CarsTypesSuccessState(cars));
      },
    );
  }
}
