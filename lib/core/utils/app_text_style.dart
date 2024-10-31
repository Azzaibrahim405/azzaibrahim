import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(
    {required Color color, required double size, required FontWeight weight}) {
  return GoogleFonts.rubik(color: color, fontSize: size.sp, fontWeight: weight);
}

//bold style
TextStyle boldStyle({required Color color, required double size}) {
  return textStyle(color: color, size: size.sp, weight: FontWeight.w600);
}

// semiBold style
TextStyle semiBold({required double size, required Color color}) {
  return textStyle(color: color, size: size.sp, weight: FontWeight.w500);
}

//regular style
TextStyle regularStyle({required double size, required Color color}) {
  return textStyle(color: color, size: size.sp, weight: FontWeight.w400);
}
