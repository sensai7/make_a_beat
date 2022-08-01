import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    "nDailyChallenges": 0,
  };

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //fixme soft: cookies for web? not a priority, first lets get the android app rolling
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      statsData["nBoots"] = (prefs.getInt('nBoots') ?? 0);
      statsData["nChallenges"] = (prefs.getInt('nChallenges') ?? 0);
      statsData["nDailyChallenges"] = (prefs.getInt('nDailyChallenges') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // todo soft: other stats

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    "Finished challenges: ${statsData['nChallenges']}",
                    style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      height: 1,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "Finished daily challenges: ${statsData['nDailyChallenges']}",
                    style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.w900,
                      fontSize: 100,
                      height: 1,
                    ),
                    maxLines: 1,
                  ),
                  const ReturnToHomeButton(isPop: true),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
