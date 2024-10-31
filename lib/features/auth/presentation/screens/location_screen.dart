import 'package:best_touch_training/features/auth/presentation/screens/components/custom_google_map_widget.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomGoogleMapWidget(),
    );
  }
}
