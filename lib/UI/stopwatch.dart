import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch/UI/elapsed_time_text.dart';
import 'package:stopwatch/UI/reset_button.dart';
import 'package:stopwatch/UI/start_stop_button.dart';
import 'package:stopwatch/UI/stopwatch_render.dart';

import 'elapsed_time_text_basics.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}



class _StopWatchState extends State<StopWatch>
    with SingleTickerProviderStateMixin {

   Duration _previouslyElapsed = Duration.zero;
   Duration _currentlyElapsed = Duration.zero;

  Duration get _elapsed =>  _previouslyElapsed+ _currentlyElapsed;
  bool _isRunning = false;
  late final Ticker _ticker;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
      if(_isRunning){
        _ticker.start();
      }else{
        _ticker.stop();
        _previouslyElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
      }
    });
  }

  void stop(){
    setState(() {
      _isRunning = false;
      _currentlyElapsed = Duration.zero;
      _previouslyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var radius = constraints.maxWidth / 2.0;
      return Stack(
        children: [
          StopWatchRenderer(elapsed: _elapsed, radius: radius),
          // reset button
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ResetButton(
                onPressed: stop,
              ),
            ),
          ),
          // start and stop button
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              height: 80,
              child: StartStopButton(
                onPressed: _toggleRunning,
                isRunning: _isRunning,
              ),
            ),
          )
        ],
      );
    });
  }
}
