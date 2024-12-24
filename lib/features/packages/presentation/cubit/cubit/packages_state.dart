part of 'packages_cubit.dart';

sealed class PackagesState {}

final class PackagesInitial extends PackagesState {}

final class PackagesLoadingState extends PackagesState {}

final class PackagesSuccessState extends PackagesState {
  List<PackageModel> publicPackages = [];

  PackagesSuccessState({required this.publicPackages});
}

final class PackagesErrorState extends PackagesState {
  final String message;

  PackagesErrorState({required this.message});
}

final class MonthlyPackagesLoadingState extends PackagesState {}

final class MonthlyPackagesSuccessState extends PackagesState {
  List<MonthlyPackage> monthlyPackages = [];

  MonthlyPackagesSuccessState({required this.monthlyPackages});
}

final class MonthlyPackagesErrorState extends PackagesState {
  final String message;

  MonthlyPackagesErrorState({required this.message});
}

class StoreFormLoadingState extends PackagesState {}

class StoreFormSuccessState extends PackagesState {}

class StoreFormErrorState extends PackagesState {
  final String message;

  StoreFormErrorState({required this.message});
}
