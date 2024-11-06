import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: SimpleAppBar(
            leading: false,

            context: context, title: 'الحجوزات',
            // title: Text('الحجوزات '),
            bottom: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              indicatorColor: Colors.transparent,
              unselectedLabelColor: AppColors.greyColor,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              controller: tabController,
              tabs: <Widget>[
                Expanded(
                  child: Tab(
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          ' السابقه',
                        ).paddingSymmetric(35, 7)),
                  ),
                ),
                Expanded(
                  child: Tab(
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(' الحاليه').paddingSymmetric(35, 7)),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: const <Widget>[
              Center(
                child: Text("It's rainy here"),
              ),
              Center(
                child: Text("It's sunny here"),
              ),
            ],
          ),
        ));
  }
}
