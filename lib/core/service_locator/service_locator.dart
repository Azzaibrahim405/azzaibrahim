import 'package:best_touch_training/core/bloc/cubit/global_cubit.dart';
import 'package:best_touch_training/core/database/local/cache_helper.dart';
import 'package:best_touch_training/core/database/remote/api_consumer.dart';
import 'package:best_touch_training/core/database/remote/dio_consumer.dart';
import 'package:best_touch_training/features/auth/data/repository/auth_repository.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/home/data/repository/home_repository.dart';
import 'package:best_touch_training/features/home/presentation/cubit/cubit/washers_cubit/washers_cubit.dart';
import 'package:best_touch_training/features/home/presentation/home/home_cubit.dart';
import 'package:best_touch_training/features/laundry_profile/data/repository/lauandry_details_repository.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/car_sizes_cubit_cubit.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/laundry_profile_cubit.dart';
import 'package:best_touch_training/features/notifications/data/repository/notifications_repository.dart';
import 'package:best_touch_training/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:best_touch_training/features/profile/data/repository/update_profile_repository.dart';
import 'package:best_touch_training/features/profile/presentation/cubit/cubit/update_profile_cubit.dart';
import 'package:best_touch_training/features/services/data/repository/services_repository.dart';
import 'package:best_touch_training/features/services/presentation/cubit/additions_service_cubit/cubit/addition_services_cubit.dart';
import 'package:best_touch_training/features/services/presentation/cubit/service_cubit/services_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository());
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl()));
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton<HomeRepository>(() => HomeRepository());
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit(sl()));
  sl.registerLazySingleton<UpdateProfileRepository>(
      () => UpdateProfileRepository());

  sl.registerLazySingleton<UpdateProfileCubit>(() => UpdateProfileCubit(sl()));

  sl.registerLazySingleton<WashersCubit>(() => WashersCubit(sl()));
  sl.registerLazySingleton<NotificationsRepository>(
      () => NotificationsRepository());
  sl.registerLazySingleton<NotificationsCubit>(() => NotificationsCubit(sl()));
  sl.registerLazySingleton<LauandryDetailsRepository>(
      () => LauandryDetailsRepository());

  sl.registerLazySingleton<LaundryProfileCubit>(
      () => LaundryProfileCubit(sl()));

  sl.registerLazySingleton<CarSizesCubitCubit>(() => CarSizesCubitCubit(sl()));
  sl.registerLazySingleton<ServicesRepository>(() => ServicesRepository());
  sl.registerLazySingleton<ServicesCubit>(() => ServicesCubit(sl()));
  sl.registerLazySingleton<AdditionServicesCubit>(
      () => AdditionServicesCubit(sl()));
}
