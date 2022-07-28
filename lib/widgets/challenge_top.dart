import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeTop extends StatelessWidget {
  const ChallengeTop({Key? key, required this.date}) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          date != "" ? "-Daily Challenge $date-" : "-Random challenge-",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
