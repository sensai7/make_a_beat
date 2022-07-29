import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThreeTwoOneDisplayTimer extends StatelessWidget {
  const ThreeTwoOneDisplayTimer({
    Key? key,
    required this.seconds,
  }) : super(key: key);

  final String seconds;

  @override
  Widget build(BuildContext context) {
    return Text(
      seconds,
      style: GoogleFonts.redHatDisplay(
        fontWeight: FontWeight.w900,
        fontSize: 150,
        height: 1,
        fontFeatures: <FontFeature>[
          const FontFeature.tabularFigures(),
        ],
      ),
      maxLines: 1,
    );
  }
}
