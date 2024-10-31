import 'package:best_touch_training/features/home/data/models/sliders_model/sliders_model/slider_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdvertisementItem extends StatelessWidget {
  AdvertisementItem({super.key, required this.slider});
  final SliderData slider;

  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CachedNetworkImage(
        imageUrl: slider.image ?? "",
      )
    ]);
  }
}
