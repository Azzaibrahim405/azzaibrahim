import 'package:best_touch_training/features/laundry_profile/data/models/laundry_profile_model/laundry_details.dart';
import 'package:best_touch_training/features/laundry_profile/data/repository/lauandry_details_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'laundry_profile_state.dart';

class LaundryProfileCubit extends Cubit<LaundryProfileState> {
  LaundryProfileCubit(this.laundryProfileRepo) : super(LaundryProfileInitial());
  final LauandryDetailsRepository laundryProfileRepo;
  LaundryDetails? laundryProfileDetails;
  List<dynamic>? banners = [];
  void getLaundryProfile(int id) async {
    final result = await laundryProfileRepo.getLaundryDetails(id);
    result.fold(
      (failure) {
        emit(LaundryProfileErrorState(message: failure));
      },
      (profileDetails) {
        laundryProfileDetails = profileDetails;
        banners = profileDetails.banners;
        emit(LaundryProfileSuccessState(
          profileDetails,
        ));
      },
    );
  }
}
