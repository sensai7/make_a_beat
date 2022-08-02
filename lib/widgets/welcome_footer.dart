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
        const Text("MAKE A BEAT v0.1 "),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const AboutScreen();
              }),
            );
          },
          child: const Text(
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
