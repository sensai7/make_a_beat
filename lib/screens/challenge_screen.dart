import 'package:flutter/services.dart';
import 'package:make_a_beat/controllers/date_seed.dart';
import 'package:flutter/material.dart';
import '../controllers/challenge_brain.dart';
import '../widgets/challenge_bottom_bar.dart';
import '../widgets/challenge_info.dart';
import '../widgets/challenge_top.dart';

//todo animations. Is it worth it?

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({
    Key? key,
    required this.isDaily,
  }) : super(key: key);

  final bool isDaily;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    DateSeed dateSeed = DateSeed();
    ChallengeBrain challenge = ChallengeBrain(isDaily);

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ChallengeTop(date: challenge.isDaily ? dateSeed.formattedDate : ""),
              Expanded(
                flex: 8,
                child: ChallengeInfo(challenge: challenge),
              ),
              Expanded(
                flex: 2,
                child: ChallengeBottomBar(challenge: challenge),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
