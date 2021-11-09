

import 'dart:math';

import 'package:flutter/material.dart';

class ClockMarkerText extends StatelessWidget {
  const ClockMarkerText({Key? key,
    required this.maxValue,
    required this.value,
    required this.radius})
      : super(key: key);
  final int maxValue;
  final int value;
  final double radius;
  @override
  Widget build(BuildContext context) {
    const width = 30.0;
    const height = 20.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-height/2, -height, 0.0)
      ..rotateZ(pi + 2 * pi * (value / maxValue))
      ..translate(0.0, radius - 30.0, 0.0)
      ..rotateZ(pi-2 * pi  * (value/maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(value.toString(),  style: const TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}



class ClockMarkerTextCenter extends StatelessWidget {
  const ClockMarkerTextCenter({Key? key,
    required this.maxValue,
    required this.value,
    required this.radius})
      : super(key: key);
  final int maxValue;
  final int value;
  final double radius;
  @override
  Widget build(BuildContext context) {
    const width = 30.0;
    const height = 20.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(0.0, 0.0, 0.0)
        ..rotateZ( pi + (2 * pi * (value/maxValue)))
      ..translate(0.0, 10.0, 0.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(value.toString(),  style: const TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}
