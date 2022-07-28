// todo pimp the buttons' theme
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../controllers/challenge_brain.dart';
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
            // todo en vez de ir a timer screen que vaya a una countdown screen con 3 2 1 go
            return TimerScreen(time: minutes, challenge: challenge);
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
