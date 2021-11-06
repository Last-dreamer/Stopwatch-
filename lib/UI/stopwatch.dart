

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stopwatch/UI/elapsed_time_text.dart';

import 'elapsed_time_text_basics.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {

  late DateTime _initTime;
  Duration _elapsed =  Duration.zero;
  late final Timer _timer;

  @override
  void initState() {

    _initTime = DateTime.now();
   
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      var now = DateTime.now();
      setState(() {
        _elapsed =  now.difference(_initTime);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeText(
      elapsed: _elapsed,
    );
  }
}
