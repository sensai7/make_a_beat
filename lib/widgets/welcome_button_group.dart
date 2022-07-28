import 'package:flutter/material.dart';
import 'package:make_a_beat/screens/challenge_screen.dart';
import 'package:make_a_beat/screens/stats_screen.dart';
import 'package:make_a_beat/widgets/welcome_button.dart';
import 'package:make_a_beat/widgets/welcome_social_button_group.dart';
import '../controllers/challenge_brain.dart';
import '../controllers/date_seed.dart';

class WelcomeButtonGroup extends StatelessWidget {
  const WelcomeButtonGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WelcomeButton(
          text: "Daily challenge",
          whereTo: ChallengeScreen(
            isDaily: true,
          ),
        ),
        WelcomeButton(
          text: "Random Challenge",
          whereTo: ChallengeScreen(
            isDaily: false,
          ),
        ),
        const WelcomeButton(
          text: "Stats",
          whereTo: StatsScreen(),
        ),
        Row(
          children: [
            Expanded(flex: 3, child: Container()),
            const Expanded(flex: 8, child: WelcomeSocialButtonGroup()),
            Expanded(flex: 3, child: Container()),
          ],
        ),
      ],
    );
  }
}
