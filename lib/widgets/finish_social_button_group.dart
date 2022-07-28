import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:make_a_beat/widgets/social_button.dart';

// https://twitter.com/intent/tweet?button_hashtag=MakeABeat ?
String twitterUrl = 'https://twitter.com/compose/tweet?hashtags=MakeABeat';
String instagramUrl = 'https://www.instagram.com/'; //fixme better link
String tiktokUrl = 'https://www.tiktok.com/'; //fixme better link

class FinishSocialButtonGroup extends StatelessWidget {
  const FinishSocialButtonGroup({
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
