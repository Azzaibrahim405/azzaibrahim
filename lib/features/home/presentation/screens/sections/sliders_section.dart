import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/features/home/presentation/home/home_cubit.dart';
import 'package:best_touch_training/features/home/presentation/screens/components/advertisement_Item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// This widget handles only the Sliders section
class SlidersSection extends StatefulWidget {
  const SlidersSection({super.key});

  @override
  _SlidersSectionState createState() => _SlidersSectionState();
}

class _SlidersSectionState extends State<SlidersSection> {
  @override
  void initState() {
    super.initState();
    context
        .read<HomeCubit>()
        .getSliders(); // Fetch sliders when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetSlidersLoadingState) {
          return const CustomLoadingIndicator(); // Loading state
        } else if (state is GetSlidersSuccessState) {
          return CarouselSlider.builder(
            itemCount: state.Sliders.length, // Use fetched sliders
            itemBuilder: (context, index, realIndex) {
              return AdvertisementItem(slider: state.Sliders[index]);
            },
            options: CarouselOptions(autoPlay: true),
          );
        } else if (state is GetSlidersErrorState) {
          return Center(child: Text(state.message)); // Error state
        } else {
          return const SizedBox.shrink(); // Default empty state
        }
      },
    );
  }
}
