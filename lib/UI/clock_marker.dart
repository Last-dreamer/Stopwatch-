

import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondTickMarker extends StatelessWidget {

  const ClockSecondTickMarker({Key? key,required this.seconds, required this.radius}) : super(key: key);
  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    var color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    var width = 2.0;
    var height = 12.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width/2.0, -height/2.0, 0)
      ..rotateZ(2 * pi * (seconds/60))
      ..translate(0.0, radius -  height /2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
