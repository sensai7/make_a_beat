// todo pimp the buttons' theme

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    Key? key,
    required this.text,
    required this.whereTo,
  }) : super(key: key);

  final Widget whereTo;
  final String text;

  @override
  Widget build(BuildContext context) {
    print("welcome build");
    return Row(
      children: [
        Expanded(flex: 3, child: Container()),
        Expanded(
          flex: 8,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kColorText),
              minimumSize: MaterialStateProperty.all<Size>(Size(1, 50)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return whereTo;
                }),
              );
            },
            child: Text(
              text,
              style: GoogleFonts.redHatDisplay(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: kColorBackground,
              ),
            ),
          ),
        ),
        Expanded(flex: 3, child: Container()),
      ],
    );
  }
}
