import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:make_a_beat/controllers/challenge_brain.dart';

import '../controllers/date_seed.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    DateSeed dateSeed = DateSeed();
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Text("Daily challenge streak:"),
              Text("Last daily challenge:"),
              Text("Finished daily challenges:"),
              Text("Average completion time:"),
            ],
          ),
        ),
      ),
    );
  }
}
