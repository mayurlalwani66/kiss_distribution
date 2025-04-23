import 'package:flutter/material.dart';

import '../../resources/values_manager.dart';

class CurveClipperBottom extends CustomClipper<Path> {
  final double curveDepth;

  CurveClipperBottom({this.curveDepth = AppSize.s80}); // Increased curve depth

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfWidth = size.width / AppSize.s2;
    final height = size.height;

    path.lineTo(AppSize.s0, AppSize.s0);
    path.lineTo(AppSize.s0, height);

    path.quadraticBezierTo(
        halfWidth,
        height - (curveDepth + AppSize.s20), // Increase curve depth here
        size.width,
        height);

    path.lineTo(size.width, AppSize.s0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
