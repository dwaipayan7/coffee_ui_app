import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoffeeBean extends StatelessWidget {
  final double? top, left, right, bottom, degree;

  const CoffeeBean({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.degree,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Transform.rotate(
        angle: degree! * pi / 190,
        child: SvgPicture.asset(
          "images/coffee-bean.svg",
          width: 150,
        ),
      ),
    );
  }
}
