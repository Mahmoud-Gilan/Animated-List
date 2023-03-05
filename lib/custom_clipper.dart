import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomClipperShape extends CustomClipper<Path> {
  @override
  Path getClip(Size s) {
    //declared the variavles
    double h = s.height;
    double w = s.width;
    // created a path
    var p = Path();
    p.lineTo(0, h - 200);
    p.quadraticBezierTo(w / 2, h, w, h - 3000);
    p.lineTo(w, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
