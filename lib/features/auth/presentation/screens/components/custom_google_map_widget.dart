import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapWidget extends StatefulWidget {
  const CustomGoogleMapWidget({super.key});

  @override
  State<CustomGoogleMapWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomGoogleMapWidget> {
  late GoogleMapController googleMapController;
  late CameraPosition intialCameraPosition;
  @override
  void dispose() {
    googleMapController;
    super.dispose();
  }

  @override
  void initState() {
    intialCameraPosition = const CameraPosition(
      zoom: 10,
      target: LatLng(
        31.040202971304012,
        31.38180848578293,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          cameraTargetBounds: CameraTargetBounds(LatLngBounds(
            southwest: const LatLng(
              31.03711423188856,
              31.342326368639657,
            ),
            northeast: const LatLng(
              31.050645110043103,
              31.407557692615505,
            ),
          )),
          initialCameraPosition: intialCameraPosition,
        ),
        Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  googleMapController.animateCamera(CameraUpdate.zoomIn());
                },
                child: const Text('change Location')))
      ],
    );
  }
}
