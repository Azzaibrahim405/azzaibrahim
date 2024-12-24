import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/account/presentation/screens/components/custom_info_listile.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/profile/presentation/cubit/cubit/update_profile_cubit.dart';
import 'package:best_touch_training/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  void initState() {
    sl<UpdateProfileCubit>().updateProfile;
    super.initState();
  }

  bool value = false;
  var cubit = sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        context: context,
        leading: true,
        title: 'الحساب',
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CachedNetworkImage(
                          imageUrl: cubit.userProfile?.avatar ?? ''),
                    ),
                    5.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.userProfile?.name ?? '',
                          style: semiBold(
                              size: 14, color: AppColors.labelTextColor),
                        ),
                        5.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.location),
                            Text(cubit.userProfile?.location ?? ''),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                CustomElevatedButton(
                  width: 80.w,
                  height: 35,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateProfileScreen()));
                  },
                  text: 'تعديل',
                )
              ],
            ).paddingAll(10),
          ),

          // ProfileAccountCardWidget(name: ,),
          const CustomInfoCardWidget(
            leadingImage: AppAssets.wallet,
            title: 'المحفظه',
          ),
          const CustomInfoCardWidget(
            leadingImage: AppAssets.sharedPackages,
            title: 'الباقات المشتركة',
          ),
          CustomInfoCardWidget(
            leadingImage: AppAssets.notification,
            title: 'الاشعارات',
            isTrailing: SizedBox(
              child: CupertinoSwitch(
                  trackColor: Colors.grey,
                  activeColor: Colors.green,
                  value: value,
                  onChanged: (bool switchValue) {
                    setState(() {
                      value = switchValue;
                    });
                  }),
            ),
          ),
          CustomInfoCardWidget(
            leadingImage: AppAssets.language,
            title: 'اللغة',
            isTrailing: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'العربيه',
                    style: regularStyle(size: 12, color: AppColors.greyColor),
                  ),
                  20.horizontalSpace,
                  Flexible(child: SvgPicture.asset(AppAssets.arrowIosLeft))
                ],
              ),
            ),
          ),
          const CustomInfoCardWidget(
            leadingImage: AppAssets.contactUs,
            title: 'تواصل معنا',
          ),
          const CustomInfoCardWidget(
            leadingImage: AppAssets.aboutApp,
            title: 'عن التطبيق',
          ),
          const CustomInfoCardWidget(
            leadingImage: AppAssets.logout,
            title: 'تسجيل الخروج',
          ),
        ],
      ).paddingAll(10),
    );
  }
}
