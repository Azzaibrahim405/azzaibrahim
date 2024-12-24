import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/features/home/presentation/home/home_cubit.dart';
import 'package:best_touch_training/features/home/presentation/screens/home_screen.dart';
import 'package:best_touch_training/features/reservation/presentation/cubit/reservation_cubit/reservation_cubit.dart';
import 'package:best_touch_training/features/reservation/presentation/screens/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => sl<ReservationCubit>(),
      child: const ReservationScreen(),
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.home),
              label: AppStrings.home.tr(context)),
          BottomNavigationBarItem(
              label: AppStrings.reservation.tr(context),
              icon: SvgPicture.asset(AppAssets.reservation)),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            index == 0 ? const HomeScreen() : const ReservationScreen();
          });
        },
      ),
      body: screens[currentIndex],
    );
  }
}
