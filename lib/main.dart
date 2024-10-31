import 'package:best_touch_training/app/app.dart';
import 'package:best_touch_training/core/bloc/bloc_observer.dart';
import 'package:best_touch_training/core/bloc/cubit/global_cubit.dart';
import 'package:best_touch_training/core/database/local/cache_helper.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/firebase_options.dart';
import 'package:best_touch_training/services/local_notifications_service.dart';
import 'package:best_touch_training/services/push_notifications_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyBlocObserver();
  setupServiceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.wait(
      [LocalNotificationService.init(), PushNotificationsServices.init()]);
  await sl<CacheHelper>().init();
  runApp(BlocProvider(
    create: (context) => GlobalCubit(),
    child: const BestTouchApp(),
  ));
}
