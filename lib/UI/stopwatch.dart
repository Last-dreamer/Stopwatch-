

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch/UI/elapsed_time_text.dart';
import 'package:stopwatch/UI/stopwatch_render.dart';

import 'elapsed_time_text_basics.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> with SingleTickerProviderStateMixin {


  Duration _elapsed =  Duration.zero;
  late final Ticker  _ticker;

  @override
  void initState() {

    _ticker =  createTicker((elapsed) {
      setState(() {
        _elapsed =  elapsed;
      });
    });
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var radius = constraints.maxWidth / 2.0;
        return StopWatchRenderer(
          elapsed: _elapsed,
          radius: radius
        );
      }
    );
  }
}
