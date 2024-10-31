import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/laundry_profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CaruselSliderWidget extends StatefulWidget {
  const CaruselSliderWidget({super.key});

  @override
  State<CaruselSliderWidget> createState() => _CaruselSliderWidgetState();
}

class _CaruselSliderWidgetState extends State<CaruselSliderWidget> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  final PageController controller = PageController();

  final CarouselSliderController carouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    var cubit = sl<LaundryProfileCubit>();
    return Stack(
      children: [
        BlocBuilder<LaundryProfileCubit, LaundryProfileState>(
          builder: (context, state) {
            if (state is LaundryProfileLoadingState) {
              () => const CustomLoadingIndicator();
            } else if (state is LaundryProfileErrorState) {
              showToast(msg: state.message, state: ToastStates.error);
            } else if (state is LaundryProfileSuccessState) {
              return CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: cubit.banners?.length,
                  itemBuilder: (context, index, realIndex) {
                    return CachedNetworkImage(
                      imageUrl: cubit.banners![index],
                      fit: BoxFit.cover,
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        // currentIndex = index;
                      });
                    },
                  ));
            }
            return Center(
              child: Text(
                'غلط ياحيوانه',
                style: boldStyle(color: AppColors.error, size: 20),
              ),
            );
          },
        ),
        Positioned(
            bottom: 15,
            right: 130,
            left: 150,
            child: SmoothPageIndicator(
                controller: controller,
                count: 5,
                axisDirection: Axis.horizontal,
                effect: const SlideEffect(
                    spacing: 8.0,
                    dotHeight: 10,
                    radius: 10.0,
                    dotWidth: 10.0,
                    paintStyle: PaintingStyle.stroke,
                    dotColor: AppColors.dottedColor,
                    activeDotColor: Colors.amber),
                onDotClicked: (index) {
                  carouselController.animateToPage(index);
                })),
      ],
    );
  }
}
