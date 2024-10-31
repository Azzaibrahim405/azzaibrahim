import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/home/presentation/cubit/cubit/washers_cubit/washers_cubit.dart';
import 'package:best_touch_training/features/home/presentation/home/home_cubit.dart';
import 'package:best_touch_training/features/home/presentation/screens/components/loyality_packages_widget.dart';
import 'package:best_touch_training/features/home/presentation/screens/components/washers_item_widget.dart';
import 'package:best_touch_training/features/home/presentation/screens/sections/get_profile_section.dart';
import 'package:best_touch_training/features/home/presentation/screens/sections/sliders_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    sl<HomeCubit>().getSliders();
    sl<AuthCubit>().getProfileUser();
    sl<WashersCubit>().getAllWashers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const getprofilesection(),
            16.verticalSpace,
            const SlidersSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: LoyalityPackagesWidget(
                    onTap: () =>
                        navigate(context: context, route: Routes.loyality),
                    title: 'نقاط الولاء',
                    // onTap: navigate(context: context, route: Routes.loyality),
                    image: AppAssets.loyality,
                  ),
                ),
                20.horizontalSpace,
                Expanded(
                  child: LoyalityPackagesWidget(
                    title: 'الباقات',
                    image: AppAssets.packages,
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Align(
              alignment: Alignment.topRight,
              child: Text(
                AppStrings.exploreStations.tr(context),
              ),
            ),
            16.verticalSpace,
            Expanded(
              child: BlocBuilder<WashersCubit, WashersState>(
                builder: (context, state) {
                  if (state is GetAllWahersLoadingState) {
                    return const CustomLoadingIndicator();
                  } else if (state is GetAllWahersErrorState) {
                    showToast(msg: state.message, state: ToastStates.error);
                  } else if (state is GetAllWahersSuccessState) {
                    return ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return WashersItemWidget(state.allWashers[index]);
                        },
                        separatorBuilder: (context, index) => 16.verticalSpace,
                        itemCount: state.allWashers.length);
                  }
                  return const Text('');
                },
              ),
            )
          ],
        ).paddingAll(16),
      ),
    );
  }
}
