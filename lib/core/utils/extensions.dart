import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on Widget {
  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding Directional
  Padding paddingStart(double start) {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: start), child: this);
  }

  Padding paddingEnd(double end) {
    return Padding(padding: EdgeInsetsDirectional.only(end: end), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return padding Symmetric
  Padding paddingSymmetric(double horizontal, double vertical) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: vertical.h, horizontal: horizontal.w),
        child: this);
  }

  Padding paddingVertical(double padding) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: padding.h), child: this);
  }

  Padding paddingHorizontal(double padding) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding.w), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly(
      {double top = 0.0,
      double left = 0.0,
      double bottom = 0.0,
      double right = 0.0}) {
    return Padding(
        padding: EdgeInsets.fromLTRB(left.w, top.h, right.w, bottom.h),
        child: this);
  }

  Padding paddingDirectionalOnly(
      {double top = 0.0,
      double start = 0.0,
      double bottom = 0.0,
      double end = 0.0}) {
    return Padding(
        padding: EdgeInsetsDirectional.only(
            top: top.h, bottom: bottom.h, start: start, end: end),
        child: this);
  }

  Padding paddingDirectionalAll({double padding = 0}) {
    return Padding(padding: EdgeInsetsDirectional.all(padding), child: this);
  }
}
