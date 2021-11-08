
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch/UI/clock_hand.dart';
import 'package:stopwatch/UI/clock_marker.dart';
import 'package:stopwatch/UI/elapsed_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer({Key? key, required this.elapsed, required this.radius}) : super(key: key);

  final Duration elapsed;
  final double radius;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // smaller tickers for seconds
        for(var i=0;i<60;i++)
          Positioned(
              top: radius,
              left: radius,
              child: ClockSecondTickMarker(seconds: i, radius: radius)
          ),


        Container(
           decoration: BoxDecoration(
             border: Border.all(color: Colors.transparent, width: 2),
             borderRadius: BorderRadius.circular(radius)
           ),
        ),

        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
              rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
              handThickness: 3,
              handLength: radius,
              color: Colors.orange),
        ),

        Positioned(
          left: 0,
          right: 0,
            top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
