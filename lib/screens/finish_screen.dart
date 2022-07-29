import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_a_beat/controllers/challenge_brain.dart';
import 'package:make_a_beat/screens/welcome_screen.dart';
import '../controllers/date_seed.dart';
import '../widgets/challenge_top.dart';
import '../widgets/finish_social_button_group.dart';
import '../widgets/return_to_home_button.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({
    Key? key,
    required this.challenge,
  }) : super(key: key);

  final ChallengeBrain challenge;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    DateSeed dateSeed = DateSeed();
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => const WelcomeScreen()), (route) => false);
            return Future.value(false);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ChallengeTop(date: challenge.isDaily ? dateSeed.formattedDate : ""),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      "TIME'S UP!",
                      style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.w900,
                        fontSize: 100,
                        height: 1,
                      ),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      "SHARE YOUR BEAT:",
                      style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        height: 1,
                      ),
                      maxLines: 1,
                    ),
                    const FinishSocialButtonGroup(),
                    AutoSizeText(
                      "TWEAK YOUR BEAT",
                      style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.w900,
                        fontSize: 100,
                        height: 1,
                      ),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      "MAKE A SONG",
                      style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.w900,
                        fontSize: 100,
                        height: 1,
                      ),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      "OUT OF IT",
                      style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.w900,
                        fontSize: 100,
                        height: 0.5,
                      ),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      "HAVE FUN",
                      style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.w900,
                        fontSize: 100,
                        height: 1,
                      ),
                      maxLines: 1,
                    ),
                    const ReturnToHomeButton(isPop: false),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
