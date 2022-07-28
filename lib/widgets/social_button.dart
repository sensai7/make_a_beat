// todo pimp the buttons' theme
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.icon,
    required this.whereTo,
  }) : super(key: key);

  final String whereTo;
  final IconData icon;

  Future<void> openURL(String url) async {
    // if (await canLaunchUrl(Uri(path: url))) {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // style: ButtonStyle(
      //   backgroundColor: MaterialStateProperty.all<Color>(kColorText),
      // ),
      onPressed: () {
        openURL(whereTo);
      },
      icon: Icon(
        icon,
        size: 30,
      ),
      color: kColorText,
    );
  }
}
