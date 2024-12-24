import 'package:best_touch_training/features/packages/data/models/form_data_model.dart';
import 'package:best_touch_training/features/packages/data/models/get_monthly_package_model/monthly_package.dart';
import 'package:best_touch_training/features/packages/data/models/public_packages_model/package_model.dart';
import 'package:best_touch_training/features/packages/data/repo/packages_repository.dart';
import 'package:bloc/bloc.dart';

part 'packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  PackagesCubit(this.packagesRepo) : super(PackagesInitial());
  final PackagesRepository packagesRepo;
  List<PackageModel> packagesList = [];
  List<MonthlyPackage> monthlyPackage = [];
  PackageModel? packageModel;
  Future<void> getAllPublicPackages() async {
    emit(PackagesLoadingState());
    final result = await packagesRepo.getPublicPackages();
    result.fold(
      (failure) {
        emit(PackagesErrorState(message: failure));
      },
      (right) {
        packagesList = right.data?.packages ?? [];

        emit(PackagesSuccessState(publicPackages: packagesList));
      },
    );
  }

  Future<void> getmonthlyPackage() async {
    emit(MonthlyPackagesLoadingState());
    final result = await packagesRepo.getMonthlyPackage();
    result.fold(
      (failure) {
        emit(MonthlyPackagesErrorState(message: failure));
      },
      (right) {
        monthlyPackage = right.data?.data ?? [];
        emit(MonthlyPackagesSuccessState(monthlyPackages: monthlyPackage));
      },
    );
  }

  Future<void> storeFormData(FormDataModel formDataModel) async {
    emit(StoreFormLoadingState());
    final result = await packagesRepo.storeFormData(formDataModel);
    result.fold(
      (failure) {
        emit(StoreFormErrorState(message: failure));
      },
      (right) {
        emit(StoreFormSuccessState());
      },
    );
  }
}
