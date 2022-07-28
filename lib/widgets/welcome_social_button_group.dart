import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:make_a_beat/widgets/social_button.dart';

String twitterUrl = 'https://twitter.com/search?q=%23MakeABeat';
String instagramUrl = 'https://www.instagram.com/explore/tags/MakeABeat/';
String tiktokUrl = 'https://www.tiktok.com/tag/makeabeat';

class WelcomeSocialButtonGroup extends StatelessWidget {
  const WelcomeSocialButtonGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SocialButton(
          icon: FontAwesomeIcons.twitter,
          whereTo: twitterUrl,
        ),
        SocialButton(
          icon: FontAwesomeIcons.instagram,
          whereTo: instagramUrl,
        ),
        SocialButton(
          icon: FontAwesomeIcons.tiktok,
          whereTo: tiktokUrl,
        ),
      ],
    );
  }
}
