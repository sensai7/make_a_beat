import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/return_to_home_button.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  var statsData = {
    "nBoots": 0,
    "nChallenges": 0,
    // "": 0,
    // "": 0,
    // "": 0,
    // "": 0,
    // "": 0,
    // "": 0,
  };

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //fixme cookies for web?
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      statsData["nBoots"] = (prefs.getInt('nBoots') ?? 0);
      statsData["nChallenges"] = (prefs.getInt('nChallenges') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // todo general formatting
    // todo all the other stats

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              //Text("Number of boots: ${_statsData["nBoots"]}"),
              Text("Daily challenge streak: "),
              Text("Last daily challenge:"),
              Text("Finished daily challenges:"),
              Text("Finished challenges: ${statsData["nChallenges"]}"),
              Text("Average completion time:"),
              const ReturnToHomeButton(isPop: true),
            ],
          ),
        ),
      ),
    );
  }
}
