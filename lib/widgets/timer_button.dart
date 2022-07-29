import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function onTap;

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
              onTap();
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
