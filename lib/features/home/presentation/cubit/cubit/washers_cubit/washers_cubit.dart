import 'package:best_touch_training/features/home/data/models/get_all_washers/get_all_washers_model/datum.dart';
import 'package:best_touch_training/features/home/data/repository/home_repository.dart';
import 'package:bloc/bloc.dart';
part 'washers_state.dart';

class WashersCubit extends Cubit<WashersState> {
  final HomeRepository homeRepo;
  WashersCubit(this.homeRepo) : super(WashersInitial());

  List<Datum> washers = [];
  void getAllWashers() async {
    emit(GetAllWahersLoadingState());
    final result = await homeRepo.getAllWashers(lat: 23.12, long: 23.12);
    result.fold(
      (left) {
        emit(GetAllWahersErrorState(left));
      },
      (right) {
        washers = right.data ?? [];
        emit(GetAllWahersSuccessState(washers));
      },
    );
  }
}
