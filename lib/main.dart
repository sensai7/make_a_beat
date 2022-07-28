import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:make_a_beat/screens/welcome_screen.dart';
import 'constants.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
    // ensures black navigation bar on android
    //todo top bar being wonky
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom, //This line is used for showing the bottom bar
    ]);
  } else if (defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows) {
    // Some desktop specific code there
  } else {
    // Some web specific code there
  }

  runApp(const MakeABeat());
}

class MakeABeat extends StatelessWidget {
  const MakeABeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return MaterialApp(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kColorBackground,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: kColorPrimary,
              secondary: kColorSecondary,
            ),
            textTheme: GoogleFonts.redHatDisplayTextTheme(
              Theme.of(context).textTheme.apply(
                    bodyColor: kColorText,
                    displayColor: kColorText,
                  ),
            ),
          ),
          home: const WelcomeScreen(),
        );
      },
      //clipBehavior: Clip.hardEdge,
      maximumSize: const Size(775.0, 812.0), // Maximum size
      enabled: kIsWeb, // default is enable, when disable content is full size
      backgroundColor: kColorBackground, // Background color/white space
    );
  }
}
