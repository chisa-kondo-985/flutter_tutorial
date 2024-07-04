import 'package:flutter/material.dart';

enum Role {
  vocals,
  guitar,
  bassGuitar,
  drums,
  piano;

  Widget roleIcon() {
    switch (this) {
      case Role.vocals:
        return Image.asset('assets/icons/mic.png', width: 30.0, height: 30.0);
      case Role.guitar:
        return Image.asset('assets/icons/guitar.png', width: 30.0, height: 30.0);
      case Role.bassGuitar:
        return Image.asset('assets/icons/bass_guitar.png', width: 30.0, height: 30.0);
      case Role.drums:
        return Image.asset('assets/icons/drums.png', width: 30.0, height: 30.0);
      case Role.piano:
        return Image.asset('assets/icons/piano.png', width: 30.0, height: 30.0);
    }
  }
}
