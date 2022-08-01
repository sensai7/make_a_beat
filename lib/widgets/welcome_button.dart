import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../controllers/date_seed.dart';
import 'package:google_fonts/google_fonts.dart';

//needs to be stateful to disable the daily challenge since it reads the state from a future
class WelcomeButton extends StatefulWidget {
  const WelcomeButton({
    Key? key,
    required this.text,
    required this.whereTo,
    required this.isDaily,
  }) : super(key: key);

  final Widget whereTo;
  final String text;
  final bool isDaily;

  @override
  State<WelcomeButton> createState() => _WelcomeButtonState();
}

class _WelcomeButtonState extends State<WelcomeButton> {
  bool shouldDisable = false;

  void disableDaily() async {
    DateSeed dateSeed = DateSeed();
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      shouldDisable = prefs.getBool(dateSeed.formattedDate) ?? false;
    });
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: kColorText,
        content: Text(
          'Daily challenge already completed',
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: kColorBackground,
          ),
        ),
        action: SnackBarAction(label: 'HIDE', onPressed: scaffold.hideCurrentSnackBar, textColor: kColorBackground),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDaily) {
      disableDaily();
    }

    return Row(
      children: [
        Expanded(flex: 3, child: Container()),
        Expanded(
          flex: 8,
          child: ElevatedButton(
            style: shouldDisable
                ? ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                    minimumSize: MaterialStateProperty.all<Size>(const Size(1, 50)),
                  )
                : ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kColorText),
                    minimumSize: MaterialStateProperty.all<Size>(const Size(1, 50)),
                  ),
            onPressed: shouldDisable
                ? () {
                    _showToast(context);
                  }
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return widget.whereTo;
                      }),
                    );
                  },
            child: Text(
              widget.text,
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
