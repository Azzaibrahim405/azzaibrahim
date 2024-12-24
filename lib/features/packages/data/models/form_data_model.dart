import 'dart:io';

import 'package:dio/dio.dart';

class FormDataModel {
  int? washerId;
  int? packageId;
  int? vehicleNumber;
  String? vehicleLetter;
  String? brand;
  String? model;
  List<File>? images;
  FormDataModel({
    this.washerId,
    this.packageId,
    this.brand,
    this.model,
    this.images,
    this.vehicleLetter,
    this.vehicleNumber,
  });

     Future<Map<String, dynamic>> azza() async => {
        'washer_id': washerId,
        'package_id': packageId,
        'vehicle_number': vehicleNumber,
        'vehicle_letter': 'asd',
        'brand': "brand",
        'model': model,
        if (images != null) ...{
          for (int i = 0; i < images!.length; i++) ...{
            'images[$i]':await MultipartFile.fromFile(images![i].path),
          }
        }
      };
}
