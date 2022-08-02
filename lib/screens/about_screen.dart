import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../widgets/return_to_home_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    Key? key,
  }) : super(key: key);

  Future<void> openURL(String url) async {
    // if (await canLaunchUrl(Uri(path: url))) {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("App made with ", style: kAboutTextStyle),
                  GestureDetector(
                    onTap: () {
                      openURL("https://flutter.dev");
                    },
                    child: Text(
                      "Flutter",
                      style: kAboutUnderlinedTextStyle,
                    ),
                  ),
                  const FlutterLogo(),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Cassete vector created by ", style: kAboutTextStyle),
                  GestureDetector(
                    onTap: () {
                      openURL("https://www.freepik.com/author/dgim-studio");
                    },
                    child: Text(
                      "dgim-studio",
                      style: kAboutUnderlinedTextStyle,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const ReturnToHomeButton(isPop: true),
              const SizedBox(height: 30),
            ],
            //https://www.freepik.com/author/dgim-studio
          ),
        ),
      ),
    );
  }
}
