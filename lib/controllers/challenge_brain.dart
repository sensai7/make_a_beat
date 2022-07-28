import 'dart:math';
import 'package:make_a_beat/controllers/date_seed.dart';

import '../prompts.dart';

class ChallengeBrain {
  final bool isDaily;
  Random _rng = Random(0);
  int _sizeA = 0;
  int _sizeB = 0;
  int _sizeC = 0;
  int _sizeTonic = 0;
  int _sizeMode = 0;

  String promptA = "";
  String promptB = "";
  String promptC = "";
  String promptTonic = "";
  String promptMode = "";

  ChallengeBrain(this.isDaily) {
    int seed;
    if (isDaily) {
      seed = DateSeed().dateSeed;
    } else {
      seed = DateSeed().randomSeed();
    }

    // Initialize seeded rng and retrieve the prompt lists sizes
    _rng = Random(seed);
    _sizeA = kPromptAList.length;
    _sizeB = kPromptBList.length;
    _sizeC = kPromptCList.length;
    _sizeTonic = kPromptTonicList.length;
    _sizeMode = kPromptModeList.length;
    // Fill the random prompts
    promptA = kPromptAList[_rng.nextInt(_sizeA)];
    promptB = kPromptBList[_rng.nextInt(_sizeB)];
    promptC = kPromptCList[_rng.nextInt(_sizeC)];
    promptTonic = kPromptTonicList[_rng.nextInt(_sizeTonic)];
    promptMode = kPromptModeList[_rng.nextInt(_sizeMode)];
  }
}
