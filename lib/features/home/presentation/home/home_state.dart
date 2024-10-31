part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class GetSlidersLoadingState extends HomeState {}

final class GetSlidersSuccessState extends HomeState {
  List<SliderData> Sliders;
  GetSlidersSuccessState(this.Sliders);
}

final class GetSlidersErrorState extends HomeState {
  String message;
  GetSlidersErrorState(this.message);
}
