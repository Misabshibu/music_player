import 'package:audio_music_player/functions/audio_functions.dart';
import 'package:audio_music_player/functions/splash_functions.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    SplashFunctions.goToHomepage(context: context);
    return const Scaffold(
      body: Center(
        child: Text('loading...'),
      ),
    );
  }
}
