import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/challenge_brain.dart';

class TimerPromptBulletList extends StatelessWidget {
  const TimerPromptBulletList({Key? key, required this.challenge}) : super(key: key);

  final ChallengeBrain challenge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AutoSizeText(
          "\u2022 ${challenge.promptTonic} ${challenge.promptMode}",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            height: 1.6,
          ),
          maxLines: 1,
        ),
        AutoSizeText(
          "\u2022 ${challenge.promptA}",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            height: 1.6,
          ),
          maxLines: 1,
        ),
        AutoSizeText(
          "\u2022 ${challenge.promptB}",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            height: 1.6,
          ),
          maxLines: 1,
        ),
        AutoSizeText(
          "\u2022 ${challenge.promptC}",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            height: 1.6,
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}
