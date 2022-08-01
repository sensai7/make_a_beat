import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/challenge_brain.dart';
import '../screens/timer_screen.dart';
import '../widgets/three_two_one_display_timer.dart';

class ThreeTwoOneScreen extends StatefulWidget {
  const ThreeTwoOneScreen({
    Key? key,
    required this.time,
    required this.challenge,
  }) : super(key: key);

  final int time;
  final ChallengeBrain challenge;

  @override
  State<ThreeTwoOneScreen> createState() => _ThreeTwoOneScreenState();
}

class _ThreeTwoOneScreenState extends State<ThreeTwoOneScreen> {
  late CountdownTimerController controller;
  int endTime = 0;

  void onTimerEnd() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return TimerScreen(time: widget.time, challenge: widget.challenge);
      }),
    );
  }

  StatelessWidget timerWidgetBuilder({CurrentRemainingTime? time}) {
    if (time == null) {
      return Text(
        "",
        style: GoogleFonts.redHatDisplay(
          fontWeight: FontWeight.w900,
          fontSize: 150,
          height: 1,
          fontFeatures: <FontFeature>[
            const FontFeature.tabularFigures(),
          ],
        ),
      );
    } else {
      String seconds;
      seconds = (time.sec! - 1).toString();

      return ThreeTwoOneDisplayTimer(
        seconds: seconds,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // fixme material, probably: The extra 1ms softens a lot the animation but starts the number of seconds in 4 so it
    // has to -1 in the display widget. Refer to the (time.sec! - 1).toString(); in timerWidgetBuilder
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 4 + 10;

    controller = CountdownTimerController(endTime: endTime, onEnd: onTimerEnd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CountdownTimer(
            controller: controller,
            onEnd: onTimerEnd,
            endTime: endTime,
            widgetBuilder: (buildContext, time) {
              return timerWidgetBuilder(time: time);
            }),
      ),
    );
  }
}
