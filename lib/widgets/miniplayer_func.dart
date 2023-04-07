import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_music_player/core/constants.dart';
import 'package:audio_music_player/screens/home%20screen/home_screen.dart';
import 'package:audio_music_player/screens/now%20playing/now_playing_screen.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../functions/audio_functions.dart';

miniPlayerBottomsheet(
    {required BuildContext context,
    required Size size,
    required animationController,
    required List<Audio> allSongs}) {
  homeFloatingButton.value = false;

  showModalBottomSheet(
      isDismissible: false,
      backgroundColor: const Color.fromARGB(0, 218, 202, 202),
      enableDrag: true,
      elevation: 0,
      context: context,
      builder: (context) {
        return AudioFucntions.assetsAudioPlayer.builderCurrent(
            builder: (context, Playing? playing) {
          Audio myAudio =
              AudioFucntions.find(allSongs, playing!.audio.assetAudioPath);
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ScreenNowPlaying()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: size.width * 0.4,
                child: Stack(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        replacement: SizedBox(
                          height: size.width * 0.18,
                        ),
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: size.width * 0.18,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.35,
                                ),
                                SizedBox(
                                  width: size.width * 0.3,
                                  child: Column(
                                    // mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        myAudio.metas.title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        myAudio.metas.artist.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      AudioFucntions.assetsAudioPlayer
                                          .builderRealtimePlayingInfos(builder:
                                              (context,
                                                  RealtimePlayingInfos infos) {
                                        Duration currentPos =
                                            infos.currentPosition;
                                        Duration total = infos.duration;
                                        return ProgressBar(
                                          barHeight: 3,
                                          thumbRadius: 3,
                                          timeLabelTextStyle:
                                              const TextStyle(fontSize: 0),
                                          progress: currentPos,
                                          total: total,
                                          onSeek: (to) {
                                            AudioFucntions.assetsAudioPlayer
                                                .seek(to);
                                          },
                                        );
                                      })
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ).asGlass(
                              clipBorderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: 48),
                        height: size.width * 0.18,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: const Color(0Xff4b4474),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  AudioFucntions.prevSong();
                                },
                                child: const Icon(
                                  Icons.skip_previous_sharp,
                                  size: 35,
                                )),
                            widthbox20,
                            AudioFucntions.assetsAudioPlayer.builderIsPlaying(
                                builder: (context, isPlaying) {
                              return GestureDetector(
                                onTap: () {
                                  if (isPlaying) {
                                    AudioFucntions.assetsAudioPlayer.pause();
                                    animationController.stop();
                                  } else {
                                    AudioFucntions.assetsAudioPlayer.play();
                                    animationController.repeat();
                                  }
                                },
                                child: Card(
                                  child: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    size: 35,
                                  ),
                                ),
                              );
                            }),
                            widthbox20,
                            GestureDetector(
                                onTap: () {
                                  AudioFucntions.nextSong();
                                },
                                child: const Icon(
                                  Icons.skip_next_sharp,
                                  size: 35,
                                )),
                            widthbox20,
                            // GestureDetector(
                            //     child: const Icon(
                            //   Icons.cancel_outlined,
                            //   size: 30,
                            // )),
                            widthbox10
                          ],
                        ),
                      ).asGlass(
                        clipBorderRadius: BorderRadius.circular(16.0),
                      ),
                    ],
                  ),
                  Positioned(
                      left: 30,
                      bottom: 30,
                      child: SizedBox(
                        child: CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.white,
                            child: AnimatedBuilder(
                              animation: animationController,
                              child: ClipOval(
                                // radius: 38.0,
                                child: CircleAvatar(
                                  radius: 38,
                                  child: Container(
                                    width: size.width * 0.22,
                                    height: size.height * 0.12,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: QueryArtworkWidget(
                                        artworkFit: BoxFit.cover,
                                        id: int.parse(myAudio.metas.id!),
                                        type: ArtworkType.AUDIO,
                                        nullArtworkWidget: Image.asset(
                                          'assets/images/nullsong_img.jpg',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              ),
                              builder: (BuildContext context, Widget? widget) {
                                return Transform.rotate(
                                  angle: animationController.value * 6.3,
                                  child: widget,
                                );
                              },
                            )

                            //  CircleAvatar(
                            //   radius: 38.0,
                            //   backgroundImage: NetworkImage(
                            //     'https://i.pinimg.com/564x/eb/26/bd/eb26bdbeb5c7fae05ff44734cc995a5e.jpg',
                            //   ),
                            //   child: Center(
                            //     child: CircleAvatar(
                            //       radius: 8,
                            //     ),
                            //   ),
                            // )

                            ),
                      )),
                ]),
              ),
            ),
          );
        });
      }).then((value) {
    homeFloatingButton.value = true;
  });
}
