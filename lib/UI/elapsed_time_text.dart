

import 'package:flutter/cupertino.dart';

class ElapsedTimeText extends StatelessWidget {
  ElapsedTimeText({Key? key, required this.elapsed}) : super(key: key);
  Duration elapsed;

  @override
  Widget build(BuildContext context) {
    final hundreds = (elapsed.inMilliseconds / 10) % 100;
    final seconds = elapsed.inSeconds % 60;
    final minutes = elapsed.inMinutes % 60;
    final hundredsStr = hundreds.toStringAsFixed(0).padLeft(2, "0");
    final secondsStr = seconds.toString().padLeft(2,"0");
    final minutesStr = minutes.toString().padLeft(2,"0");

    const width = 14.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 6,),
        TimeDigit(text: minutesStr.substring(0,1), width: width),
        TimeDigit(text: minutesStr.substring(1,2), width: width),
       const TimeDigit(text: ":", width: 6),
        const SizedBox(width: 6,),
        TimeDigit(text: secondsStr.substring(0,1), width: width),
        TimeDigit(text: secondsStr.substring(1,2), width: width),
        const TimeDigit(text: ".", width: 6),
        const SizedBox(width: 12,),
        TimeDigit(text: hundredsStr.substring(0,1), width: width),
        TimeDigit(text: hundredsStr.substring(1,2), width: width),
      ],
    );
  }
}

class TimeDigit extends StatelessWidget {
  const TimeDigit({Key? key, required this.text, required this.width}) : super(key: key);
  final String text;
  final double width;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

