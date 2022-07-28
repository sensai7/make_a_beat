import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerDisplayTimer extends StatelessWidget {
  const TimerDisplayTimer({
    Key? key,
    required this.minutes,
    required this.seconds,
  }) : super(key: key);

  final String minutes;
  final String seconds;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$minutes:$seconds",
      style: GoogleFonts.redHatDisplay(
        fontWeight: FontWeight.w900,
        fontSize: 80,
        height: 1,
        fontFeatures: <FontFeature>[
          const FontFeature.tabularFigures(),
        ],
      ),
      maxLines: 1,
    );
  }
}
