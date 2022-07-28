import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          "MAKE A",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 90,
            height: 1,
          ),
          maxLines: 1,
        ),
        AutoSizeText(
          'BEAT',
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 130,
            height: 0.9,
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}
