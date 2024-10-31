part of 'global_cubit.dart';

abstract class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class GlobalLoadingState extends GlobalState {}

final class GlobalSuccessState extends GlobalState {}

final class GlobalErrorState extends GlobalState {}
