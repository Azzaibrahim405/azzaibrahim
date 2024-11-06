import 'package:best_touch_training/core/bloc/cubit/global_cubit.dart';
import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/routes/app_routes.dart';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/theme/app_theme.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/home/presentation/cubit/cubit/washers_cubit/washers_cubit.dart';
import 'package:best_touch_training/features/home/presentation/home/home_cubit.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/car_sizes_cubit_cubit.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/laundry_profile_cubit.dart';
import 'package:best_touch_training/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:best_touch_training/features/profile/presentation/cubit/cubit/update_profile_cubit.dart';
import 'package:best_touch_training/features/services/presentation/cubit/additions_service_cubit/cubit/addition_services_cubit.dart';
import 'package:best_touch_training/features/services/presentation/cubit/service_cubit/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BestTouchApp extends StatelessWidget {
  const BestTouchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
              builder: (context, state) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => sl<AuthCubit>()),
                    BlocProvider(create: (context) => sl<HomeCubit>()),
                    BlocProvider(create: (context) => sl<WashersCubit>()),
                    BlocProvider(create: (context) => sl<NotificationsCubit>()),
                    BlocProvider(create: (context) => sl<UpdateProfileCubit>()),
                    BlocProvider(create: (context) => sl<CarSizesCubitCubit>()),
                    BlocProvider(
                        create: (context) => sl<LaundryProfileCubit>()),
                    BlocProvider(create: (context) => sl<ServicesCubit>()),
               BlocProvider(create: (context) => sl<AdditionServicesCubit>()),

                  ],
                  child: MaterialApp(
                    supportedLocales: const [
                      Locale('ar', "EG"),
                      Locale('en', "US")
                    ],
                    locale:
                        Locale(BlocProvider.of<GlobalCubit>(context).langCode),
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      AppLocalizations.delegate,
                    ],
                    debugShowCheckedModeBanner: false,
                    title: 'Best Touch App',
                    theme: appTheme(),
                    initialRoute: Routes.splash,
                    onGenerateRoute: AppRoutes.generateRoute,
                  ),
                );
              },
            ));
  }
}
