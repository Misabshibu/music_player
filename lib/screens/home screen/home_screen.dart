import 'package:audio_music_player/core/constants.dart';
import 'package:audio_music_player/screens/home%20screen/widgets/home_song_lists.dart';
import 'package:audio_music_player/screens/home%20screen/widgets/home_title_widget.dart';
import 'package:audio_music_player/screens/home%20screen/widgets/playlists_home_lists.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTitle(),
                heightbox10,
                // AnimatedSwitcher(
                //   duration: const Duration(milliseconds: 300),
                //   transitionBuilder:
                //       (Widget child, Animation<double> animation) {
                //     return ScaleTransition(scale: animation, child: child);
                //   },
                //   child: scrollNotifier.value
                //       ? PlaylistsHomeList(size: size)
                //       : const SizedBox(),
                // ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: scrollNotifier.value ? 1.0 : 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    alignment: Alignment.topCenter,
                    width: size.width,
                    height: scrollNotifier.value ? size.width * 0.35 : 0,
                    child: PlaylistsHomeList(size: size),
                  ),
                ),
                heightbox10,
                const Text(
                  'Sample',
                  style: TextStyle(fontSize: 25),
                ),
                const HomeSongLists(),
                //.........................//
                // Stack(children: [
                //   Column(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Visibility(
                //         visible: false,
                //         child: Container(
                //           height: size.width * 0.15,
                //           width: double.infinity,
                //           color: Colors.amber,
                //         ),
                //       ),
                //       Container(
                //         // margin: EdgeInsets.only(top: 48),
                //         height: size.width * 0.15,
                //         decoration: const BoxDecoration(
                //           color: Colors.white,
                //           // borderRadius: BorderRadius.circular(16.0),
                //         ),
                //       ),
                //     ],
                //   ),
                //   const Positioned(
                //       left: 30,
                //       bottom: 30,
                //       child: SizedBox(
                //         child: CircleAvatar(
                //           radius: 40.0,
                //           backgroundColor: Colors.white,
                //           child: CircleAvatar(
                //             radius: 38.0,
                //           ),
                //         ),
                //       )),
                // ])
              ],
            );
          }),
    )));
  }
}
