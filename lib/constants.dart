import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kColorBackground = Color(0xFF212c28);
const Color kColorPrimary = Colors.green;
const Color kColorSecondary = Colors.red;
const Color kColorText = Color(0xFFffb400);

TextStyle kTimerTextStyle = GoogleFonts.redHatMono(
  fontWeight: FontWeight.w700,
  fontSize: 120,
  height: 1,
);

TextStyle kAboutTextStyle = GoogleFonts.redHatDisplay(
  fontWeight: FontWeight.w500,
  fontSize: 20,
  height: 1,
);

TextStyle kAboutUnderlinedTextStyle = GoogleFonts.redHatDisplay(
  fontWeight: FontWeight.w500,
  fontSize: 20,
  height: 1,
  decoration: TextDecoration.underline,
);
