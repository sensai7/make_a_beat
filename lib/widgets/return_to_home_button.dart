import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_a_beat/screens/welcome_screen.dart';
import '../constants.dart';

class ReturnToHomeButton extends StatelessWidget {
  const ReturnToHomeButton({Key? key, required this.isPop}) : super(key: key);

  final bool isPop;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Container()),
        Expanded(
          flex: 8,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kColorText),
              minimumSize: MaterialStateProperty.all<Size>(const Size(1, 50)),
            ),
            onPressed: () {
              isPop
                  ? Navigator.pop(context)
                  : Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const WelcomeScreen();
                      }),
                    );
            },
            child: Text(
              "Return to main screen",
              style: GoogleFonts.redHatDisplay(
                fontWeight: FontWeight.w700,
                fontSize: 16,
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
