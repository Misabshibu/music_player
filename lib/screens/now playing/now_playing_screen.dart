import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_music_player/widgets/miniplayer_func.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../functions/audio_functions.dart';
import '../../widgets/songlist_widget_home.dart';
import '../now%20playing/widgets/nowplaying_appbar.dart';

class ScreenNowPlaying extends StatelessWidget {
  ScreenNowPlaying({super.key, required this.allSongs});
  final List<Audio> allSongs;
  int currindex = nowplayingCurrentIndex;
  final SwiperController swiperController = SwiperController();

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

            SizedBox(
              width: double.infinity,
              height: size.height * 0.32,
              child: Swiper(
                  controller: swiperController,
                  index: currindex,
                  scrollDirection: Axis.horizontal,
                  onIndexChanged: (index) {
                    if (index < currindex) {
                      AudioFunctions.prevSong();
                    } else {
                      AudioFunctions.nextSong();
                    }
                    currindex = index;
                  },
                  viewportFraction: 0.7,
                  scale: 0.7,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.65,
                      height: size.height * 0.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: QueryArtworkWidget(
                            nullArtworkWidget: Image.asset(
                              'assets/images/nullsong_img.jpg',
                              fit: BoxFit.cover,
                            ),
                            artworkBorder: BorderRadius.circular(10),
                            id: int.parse(allSongs[index].metas.id!),
                            type: ArtworkType.AUDIO),
                      ),
                    );
                  },
                  itemCount: allSongs.length),
            ),

            // Container(
            //   width: size.width * 0.65,
            //   height: size.height * 0.32,
            //   decoration:
            //       BoxDecoration(borderRadius: BorderRadius.circular(15)),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(10),
            //     child: QueryArtworkWidget(
            //         nullArtworkWidget: Image.asset(
            //           'assets/images/nullsong_img.jpg',
            //           fit: BoxFit.cover,
            //         ),
            //         artworkBorder: BorderRadius.circular(10),
            //         id: int.parse(myAudio.metas.id!),
            //         type: ArtworkType.AUDIO),
            //   ),
            // ),
            AudioFunctions.assetsAudioPlayer.builderCurrent(
                builder: (context, Playing playing) {
              Audio myAudio =
                  AudioFunctions.find(allSongs, playing.audio.assetAudioPath);
              return SizedBox(
                  width: size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        myAudio.metas.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                      Text(
                        myAudio.metas.artist.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ));
            }),
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
              child: AudioFunctions.assetsAudioPlayer
                  .builderRealtimePlayingInfos(
                      builder: (context, RealtimePlayingInfos infos) {
                Duration currentPos = infos.currentPosition;
                Duration total = infos.duration;
                return ProgressBar(
                  timeLabelPadding: size.height * 0.01,
                  progress: currentPos,
                  total: total,
                  onSeek: (to) {
                    AudioFunctions.assetsAudioPlayer.seek(to);
                  },
                );
              }),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shuffle_outlined),
                InkWell(
                    onTap: () {
                      swiperController.previous();
                    },
                    child: const Icon(Icons.skip_previous_outlined)),
                AudioFunctions.assetsAudioPlayer.builderIsPlaying(
                    builder: (context, isPlaying) {
                  return InkWell(
                    onTap: () {
                      if (isPlaying) {
                        AudioFunctions.assetsAudioPlayer.pause();
                        animationController.stop();
                      } else {
                        AudioFunctions.assetsAudioPlayer.play();
                        animationController.repeat();
                      }
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    ),
                  );
                }),
                InkWell(
                    onTap: () {
                      swiperController.next();
                    },
                    child: Icon(Icons.skip_next_outlined)),
                Icon(Icons.loop)
              ],
            ),
          ],
        ));
  }
}
