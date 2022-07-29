import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/welcome_title.dart';
import '../widgets/welcome_button_group.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  Future<void> addBoot() async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getInt('nBoots') ?? 0;
    print("nBoots $counter");
    await prefs.setInt('nBoots', counter + 1);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    addBoot();

    // todo disable daily if its already done

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              const Expanded(
                flex: 5,
                child: WelcomeTitle(),
              ),
              const Expanded(
                flex: 6,
                child: WelcomeButtonGroup(),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              const Expanded(
                flex: 1,
                child: WelcomeFooter(),
              ),
              //SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeFooter extends StatelessWidget {
  const WelcomeFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("MAKE A BEAT v0.0.1"),
      ],
    );
  }
}
