import 'package:audio_music_player/screens/now%20playing/widgets/nowplaying_appbar.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class ScreenNowPlaying extends StatelessWidget {
  const ScreenNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: NowplayingAppbar()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            width: size.width * 0.65,
            height: size.height * 0.32,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(
              width: size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Text(
                    'data',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: size.height * 0.007,
                  ),
                  const Text(
                    'data',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: const [
                Icon(Icons.favorite_outline),
                Spacer(),
                Icon(Icons.playlist_add)
              ],
            ),
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ProgressBar(
                timeLabelPadding: size.height * 0.01,
                progress: const Duration(seconds: 0),
                total: const Duration(minutes: 0)),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.shuffle_outlined),
              Icon(Icons.skip_previous_rounded),
              CircleAvatar(
                radius: 30,
                child: Icon(Icons.play_arrow),
              ),
              Icon(Icons.skip_next_outlined),
              Icon(Icons.loop)
            ],
          ),
        ],
      ),
    );
  }
}
