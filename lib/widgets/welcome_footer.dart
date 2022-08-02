import 'package:flutter/material.dart';
import '../screens/about_screen.dart';

class WelcomeFooter extends StatelessWidget {
  const WelcomeFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("MAKE A BEAT v0.1 "),
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return AboutScreen();
              }),
            );
          },
          child: Text(
            "About",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
