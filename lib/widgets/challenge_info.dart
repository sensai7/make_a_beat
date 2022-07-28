import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/challenge_brain.dart';

class ChallengeInfo extends StatelessWidget {
  const ChallengeInfo({Key? key, required this.challenge}) : super(key: key);

  final ChallengeBrain challenge;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 0),
        Text(
          "LET'S",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w700,
            fontSize: 40,
            height: 1,
          ),
          maxLines: 1,
        ),
        AutoSizeText(
          "MAKE A",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 95,
            height: 1,
          ),
          maxLines: 1,
        ),
        AutoSizeText(
          'BEAT',
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 130,
            height: 0.7,
          ),
          maxLines: 1,
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(),
            Text(
              "IN ",
              style: GoogleFonts.redHatDisplay(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                height: 0.5,
              ),
              maxLines: 1,
            ),
            Text(
              challenge.promptTonic,
              style: GoogleFonts.redHatDisplay(
                fontWeight: FontWeight.w900,
                fontSize: 60,
                height: 0.5,
              ),
              maxLines: 1,
            ),
            Text(
              " ${challenge.promptMode}",
              style: GoogleFonts.redHatDisplay(
                fontWeight: FontWeight.w900,
                fontSize: 50,
                height: 0.5,
              ),
            ),
          ],
        ),
        Text(
          "WITH",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            height: 0.6,
          ),
          maxLines: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: AutoSizeText(
            "${challenge.promptA},",
            style: GoogleFonts.redHatDisplay(
              fontWeight: FontWeight.w900,
              fontSize: 60,
              height: 0.6,
            ),
            maxLines: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: AutoSizeText(
            challenge.promptB,
            style: GoogleFonts.redHatDisplay(
              fontWeight: FontWeight.w900,
              fontSize: 60,
              height: 0.8,
            ),
            maxLines: 1,
          ),
        ),
        Text(
          "AND",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            height: 0.6,
          ),
          maxLines: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: AutoSizeText(
            challenge.promptC,
            style: GoogleFonts.redHatDisplay(
              fontWeight: FontWeight.w900,
              fontSize: 60,
              height: 0.6,
            ),
            maxLines: 1,
          ),
        ),
        //const SizedBox(height: 0),
      ],
    );
  }
}
