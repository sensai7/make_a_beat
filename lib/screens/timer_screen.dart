import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:make_a_beat/constants.dart';
import 'package:make_a_beat/controllers/challenge_brain.dart';
import 'package:make_a_beat/controllers/date_seed.dart';
import 'package:make_a_beat/screens/finish_screen.dart';
import 'package:make_a_beat/screens/welcome_screen.dart';
import 'package:make_a_beat/widgets/challenge_top.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import '../widgets/timer_button.dart';
import '../widgets/timer_display_timer.dart';
import '../widgets/timer_prompt_bullet_list.dart';

//todo fit this screen style to stats/about page

class TimerScreen extends StatefulWidget {
  const TimerScreen({
    Key? key,
    required this.time,
    required this.challenge,
  }) : super(key: key);

  final int time;
  final ChallengeBrain challenge;

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late CountdownTimerController controller;
  int endTime = 0;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * (widget.time * 60 + 1);
    controller = CountdownTimerController(endTime: endTime, onEnd: onTimerEnd);
  }

  Future<void> changeStats(isDaily) async {
    final prefs = await SharedPreferences.getInstance();
    final nChallenges = prefs.getInt('nChallenges') ?? 0;
    await prefs.setInt('nChallenges', nChallenges + 1);
    if (isDaily) {
      final nDailyChallenges = prefs.getInt('nDailyChallenges') ?? 0;
      await prefs.setInt('nDailyChallenges', nDailyChallenges + 1);
      DateSeed dateSeed = DateSeed();
      await prefs.setBool(dateSeed.formattedDate, true);
    }
  }

  void onTimerEnd() {
    changeStats(widget.challenge.isDaily);
    Wakelock.disable();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return FinishScreen(
          challenge: widget.challenge,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // force portrait orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // force awake screen
    Wakelock.enable();

    // Controllers
    DateSeed dateSeed = DateSeed();

    // confirm exit dialog
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: kColorBackground,
              title: const Text('Exit screen'),
              content: const Text('Do you want to return to the main screen?'),
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kColorText),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No', style: TextStyle(color: kColorBackground)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kColorText),
                  ),
                  //onPressed: () => Navigator.of(context).pop(true),
                  onPressed: () {
                    Wakelock.disable();
                    Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (context) => const WelcomeScreen()), (route) => false);
                  },
                  child: const Text('Yes', style: TextStyle(color: kColorBackground)),
                ),
              ],
            ),
          ) ??
          false;
    }

    // Timer widget draw
    StatelessWidget timerWidgetBuilder({CurrentRemainingTime? time}) {
      if (time == null) {
        return const Text("00:00");
      } else {
        String seconds;
        String minutes;
        if (time.min == null) {
          minutes = "00";
        } else {
          minutes = time.min.toString();
        }
        seconds = time.sec.toString();
        if (seconds.length == 1) {
          seconds = "0$seconds";
        }
        if (minutes.length == 1) {
          minutes = "0$minutes";
        }

        return TimerDisplayTimer(
          minutes: minutes,
          seconds: seconds,
        );
      }
    }

    // The build material app itself
    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ChallengeTop(date: widget.challenge.isDaily ? dateSeed.formattedDate : ""),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Image(
                          image: AssetImage(
                            "images/tape.png",
                          ),
                        ),
                      ),
                      CountdownTimer(
                          controller: controller,
                          onEnd: onTimerEnd,
                          endTime: endTime,
                          widgetBuilder: (buildContext, time) {
                            return timerWidgetBuilder(time: time);
                          }),
                      TimerPromptBulletList(challenge: widget.challenge),
                      TimerButton(
                        text: "END",
                        onTap: onTimerEnd,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
