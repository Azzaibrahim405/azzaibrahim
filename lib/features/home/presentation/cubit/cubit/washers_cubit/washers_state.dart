part of 'washers_cubit.dart';

abstract class WashersState {}

final class WashersInitial extends WashersState {}

final class GetAllWahersLoadingState extends WashersState {}

final class GetAllWahersSuccessState extends WashersState {
  List<Datum> allWashers;
  GetAllWahersSuccessState(this.allWashers);
}

final class GetAllWahersErrorState extends WashersState {
  String message;
  GetAllWahersErrorState(this.message);
}
