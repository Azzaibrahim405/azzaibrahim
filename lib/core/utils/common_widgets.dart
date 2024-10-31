//methods used shared about all app
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

navigate({required BuildContext context, required String route, dynamic args}) {
  Navigator.pushNamed(context, route, arguments: args);
}

void showToast({required String msg, required ToastStates state}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getStates(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { error, success, warning }

Color getStates(ToastStates state) {
  switch (state) {
    case ToastStates.success:
      return AppColors.sucess;
    case ToastStates.warning:
      return AppColors.warning;
    case ToastStates.error:
      return AppColors.error;
  }
}
