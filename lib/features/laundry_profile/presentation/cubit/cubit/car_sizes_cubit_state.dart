part of 'car_sizes_cubit_cubit.dart';

@immutable
sealed class CarSizesCubitState {}

final class CarSizesCubitInitial extends CarSizesCubitState {}

final class CarsTypesLoadingState extends CarSizesCubitState {}

final class CarsTypesSuccessState extends CarSizesCubitState {
  List<CarData> carsSizes;
  CarsTypesSuccessState(this.carsSizes);
}

final class CarsTypesErrorState extends CarSizesCubitState {
  final String message;

  CarsTypesErrorState({required this.message});
}
