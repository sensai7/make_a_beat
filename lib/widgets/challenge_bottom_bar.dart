import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../controllers/challenge_brain.dart';
import 'challenge_minute_button.dart';

class ChallengeBottomBar extends StatelessWidget {
  const ChallengeBottomBar({Key? key, required this.challenge}) : super(key: key);

  final ChallengeBrain challenge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const Divider(
          color: kColorText,
          thickness: 3,
        ),
        const SizedBox(height: 5),
        Text(
          "I can make it in:",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChallengeMinuteButton(minutes: 2, challenge: challenge),
            ChallengeMinuteButton(minutes: 5, challenge: challenge),
            ChallengeMinuteButton(minutes: 10, challenge: challenge),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
