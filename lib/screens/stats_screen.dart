import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: const [
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
