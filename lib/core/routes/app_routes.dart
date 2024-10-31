import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/features/account/presentation/screens/account_view.dart';
import 'package:best_touch_training/features/auth/presentation/screens/forget_password.dart';
import 'package:best_touch_training/features/auth/presentation/screens/location_screen.dart';
import 'package:best_touch_training/features/auth/presentation/screens/login_screen.dart';
import 'package:best_touch_training/features/auth/presentation/screens/new_password_screen.dart';
import 'package:best_touch_training/features/auth/presentation/screens/register_screen.dart';
import 'package:best_touch_training/features/home/presentation/screens/home_screen.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/screens/laundry_profile_screen.dart';
import 'package:best_touch_training/features/layout/presentation/screens/layout_screen.dart';
import 'package:best_touch_training/features/loyality/presentation/screens/loyality_screen.dart';
import 'package:best_touch_training/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:best_touch_training/features/packages/presentation/screens/packages_screen.dart';
import 'package:best_touch_training/features/profile/presentation/screens/enter_password_screen.dart';
import 'package:best_touch_training/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:best_touch_training/features/reservation/presentation/screens/reservation_screen.dart';
import 'package:best_touch_training/features/services/presentation/screens/additions_services_screen.dart';
import 'package:best_touch_training/features/services/presentation/screens/service_screen.dart';
import 'package:best_touch_training/features/splash/presentation/screens/splash_screen.dart';
import 'package:best_touch_training/features/auth/presentation/screens/verification_code_screen.dart';
import 'package:best_touch_training/features/language/presentation/screens/language.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    dynamic args;
    if (routeSettings.arguments != null) args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.login:
        return MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        });
      case Routes.language:
        return MaterialPageRoute(builder: (context) {
          return const LanguageScreen();
        });
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.reservation:
        return MaterialPageRoute(
            builder: (context) => const ReservationScreen());
      case Routes.notifications:
        return MaterialPageRoute(
            builder: (context) => const NotificationsScreen());
      case Routes.loyality:
        return MaterialPageRoute(builder: (context) => const LoyalityScreen());
      case Routes.enterPassword:
        return MaterialPageRoute(
            builder: (context) => const EnterPasswordScreen());
      case Routes.packages:
        return MaterialPageRoute(builder: (context) => const PackagesScreen());
      case Routes.laundryProfile:
        return MaterialPageRoute(
            builder: (context) => LaundryProfileScreen(
                  id: args,
                ));
      case Routes.account:
        return MaterialPageRoute(builder: (context) => const AccountView());
      case Routes.layout:
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (context) {
          return const RegisterScreen();
        });
      case Routes.services:
        return MaterialPageRoute(
            builder: (context) => ServiceScreen(
                  serviceParams: args,
                ));
      case Routes.editProfile:
        return MaterialPageRoute(builder: (context) {
          return UpdateProfileScreen();
        });
      case Routes.location:
        return MaterialPageRoute(builder: (context) {
          return const LocationScreen();
        });
      case Routes.additionsServices:
        return MaterialPageRoute(builder: (context) {
          return AdditionsServicesScreen(
            contentParams: args,
          );
        });
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (context) {
          return const ForgetPasswordScreen();
        });

      case Routes.verificationCode:
        return MaterialPageRoute(builder: (context) {
          return VerificationCodeScreen(
            phone: args,
          );
        });
      case Routes.newPassword:
        return MaterialPageRoute(builder: (context) {
          return NewPasswordScreen(
            resetToken: args,
          );
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('Not Found Route'),
            ),
          );
        });
    }
  }
}
