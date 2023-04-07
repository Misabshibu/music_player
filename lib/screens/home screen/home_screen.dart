import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_music_player/widgets/miniplayer_func.dart';
import 'package:audio_music_player/widgets/songlist_widget_home.dart';
import '../../core/constants.dart';
import '../home%20screen/widgets/home_song_lists.dart';
import '../home%20screen/widgets/home_title_widget.dart';
import '../home%20screen/widgets/playlists_home_lists.dart';
import '../../widgets/floating_movable_button.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
ValueNotifier<bool> homeFloatingButton = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key, required this.convertedAudios});
  final List<Audio> convertedAudios;
  final List<Color> colors = [
    Colors.red[900]!,
    Colors.green[900]!,
    Colors.blue[900]!,
    Colors.brown[900]!
  ];

  final List<int> duration = [900, 700, 600, 800, 500];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: ValueListenableBuilder(
            valueListenable: homeFloatingButton,
            builder: (context, value, _) {
              return Visibility(
                  visible: homeFloatingButton.value,
                  child: FloatingMovableButton(
                    onpressfunc: () {
                      miniPlayerBottomsheet(
                          context: context,
                          size: size,
                          animationController: animationController,
                          allSongs: convertedAudios);
                    },
                  ));
            }),
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
                    HomeSongLists(allsongs: convertedAudios),
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
