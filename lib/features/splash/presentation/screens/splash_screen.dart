import 'package:best_touch_training/core/database/local/cache_helper.dart';
import 'package:best_touch_training/core/database/remote/api_keys.dart';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigatorAfterThreeSeconds() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then((value) async {
      await sl<CacheHelper>().getData(key: ApiKeys.token) == null
          ? navigate(context: context, route: Routes.login)
          : navigate(context: context, route: Routes.layout);
    });
  }

  @override
  void initState() {
    NavigatorAfterThreeSeconds();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(AppAssets.logo)],
        ),
      ),
    );
  }
}
