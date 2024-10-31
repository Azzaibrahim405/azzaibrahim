import 'dart:developer';

import 'package:best_touch_training/features/home/data/models/sliders_model/sliders_model/slider_data.dart';
import 'package:best_touch_training/features/home/data/repository/home_repository.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepo;
  HomeCubit(
    this.homeRepo,
  ) : super(HomeInitial());
  List<SliderData>? Sliders;
  void getSliders() async {
    emit(GetSlidersLoadingState());
    final result = await homeRepo.getSliders();
    result.fold(
      (left) {
        emit(GetSlidersErrorState(left));
      },
      (right) {
        Sliders = right.sliderData;
        log(Sliders.toString());
        emit(GetSlidersSuccessState(Sliders ?? []));
      },
    );
  }
}
