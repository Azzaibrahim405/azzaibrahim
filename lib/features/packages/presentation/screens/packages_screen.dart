import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/packages/presentation/cubit/cubit/packages_cubit.dart';
import 'package:best_touch_training/features/packages/presentation/screens/widgets/monthly_package_card.dart';
import 'package:best_touch_training/features/packages/presentation/screens/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocConsumer<PackagesCubit, PackagesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: SimpleAppBar(
              context: context,
              title: 'الباقات',
              leading: true,
              bottom: TabBar(
                onTap: (value) {
                  if (value == 0) {
                    context.read<PackagesCubit>().getAllPublicPackages();
                  } else {
                    context.read<PackagesCubit>().getmonthlyPackage();
                  }
                },
                indicatorColor: Colors.transparent,
                unselectedLabelColor: AppColors.greyColor,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                controller: tabController,
                tabs: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: tabController.index == 0
                          ? AppColors.primary
                          : AppColors.greyLight,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      ' المحفظه ',
                    ).paddingSymmetric(35, 7),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: tabController.index == 1
                          ? AppColors.primary // لون أخضر عند التحديد
                          : AppColors.greyLight, // لون رمادي عند عدم التحديد
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text('التوفير').paddingSymmetric(35, 7),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppAssets.copon),
                        7.horizontalSpace,
                        Text(
                          'احصل على 25% رصيد مجانى إضافي عند شراء باقة',
                          style: regularStyle(
                              size: 12, color: AppColors.greyColor),
                        )
                      ],
                    ).paddingAll(10),
                    state is PackagesSuccessState
                        ? Expanded(
                            child: GridView.builder(
                              itemCount: state.publicPackages.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return PackageItem(
                                    packageModel: state.publicPackages[index]);
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 140,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 3,
                                      crossAxisCount: 2),
                            ),
                          )
                        : const Center(child: CustomLoadingIndicator())
                  ],
                ),
                state is MonthlyPackagesSuccessState
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          return MonthlyPackageCard(
                            monthlyPackage: state.monthlyPackages[index],
                          );
                        },
                        separatorBuilder: (context, index) => 16.verticalSpace,
                        itemCount: state.monthlyPackages.length)
                    : const Center(child: CustomLoadingIndicator())
              ],
            ),
          );
        },
      ),
    );
  }
}
