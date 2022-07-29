import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_a_beat/screens/challenge_screen.dart';
import 'package:make_a_beat/widgets/timer_display_timer.dart';
import '../constants.dart';
import '../controllers/challenge_brain.dart';
import '../screens/three_two_one_screen.dart';
import '../screens/timer_screen.dart';

class ChallengeMinuteButton extends StatelessWidget {
  const ChallengeMinuteButton({
    Key? key,
    required this.minutes,
    required this.challenge,
  }) : super(key: key);

  final int minutes;
  final ChallengeBrain challenge;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kColorText),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ThreeTwoOneScreen(time: minutes, challenge: challenge);
          }),
        );
      },
      child: Text(
        "$minutes minutes",
        style: GoogleFonts.redHatDisplay(
          fontWeight: FontWeight.w700,
          color: kColorBackground,
        ),
      ),
    );
  }
}
