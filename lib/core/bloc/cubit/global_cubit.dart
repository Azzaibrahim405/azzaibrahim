import 'package:bloc/bloc.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  bool isArabic = false;
  String langCode = "ar";
  void changeLanguage() {
    emit(GlobalLoadingState());
    langCode = isArabic ? 'en' : 'ar';
    emit(GlobalSuccessState());
  }
}
