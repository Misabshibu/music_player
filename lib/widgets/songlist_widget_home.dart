import 'package:assets_audio_player/assets_audio_player.dart';
import '../core/constants.dart';
import '../functions/audio_functions.dart';
import 'miniplayer_func.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

late AnimationController animationController;

class SongListWidgetHome extends StatefulWidget {
  const SongListWidgetHome(
      {Key? key,
      required this.size,
      required this.allSongs,
      required this.index})
      : super(key: key);

  final Size size;
  final List<Audio> allSongs;
  final int index;

  @override
  State<SongListWidgetHome> createState() => _SongListWidgetHomeState();
}

class _SongListWidgetHomeState extends State<SongListWidgetHome>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AudioFucntions.songplayNow(
            fetchedaudios: widget.allSongs, index: widget.index);
        miniPlayerBottomsheet(
          allSongs: widget.allSongs,
          context: context,
          size: widget.size,
          animationController: animationController,
        );
      },
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.width * 0.2,
        // color: Colors.yellow,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: widget.size.width * 0.15,
                  height: widget.size.width * 0.15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: QueryArtworkWidget(
                        nullArtworkWidget: Image.asset(
                          'assets/images/nullsong_img.jpg',
                          fit: BoxFit.cover,
                        ),
                        artworkBorder: BorderRadius.circular(10),
                        id: int.parse(widget.allSongs[widget.index].metas.id!),
                        type: ArtworkType.AUDIO),
                  ),
                ),
                widthbox20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widget.size.width * 0.35,
                      child: Text(
                        widget.allSongs[widget.index].metas.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    heightbox5,
                    SizedBox(
                      width: widget.size.width * 0.35,
                      child: Text(
                        widget.allSongs[widget.index].metas.artist.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                widthbox10,
                const Spacer(),
                const Icon(Icons.favorite),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded)),
                const Spacer(),
                AudioFucntions.assetsAudioPlayer.builderCurrent(
                    builder: (context, Playing? playing) {
                  Audio myAudio = AudioFucntions.find(
                      widget.allSongs, playing!.audio.assetAudioPath);
                  return AudioFucntions.assetsAudioPlayer.builderIsPlaying(
                      builder: (context, isPlaying) {
                    return GestureDetector(
                      onTap: () {
                        // if (isPlaying) {
                        //   AudioFucntions.assetsAudioPlayer.pause();
                        // } else {
                        //   AudioFucntions.assetsAudioPlayer.play();
                        // }
                      },
                      child: Card(
                          child: widget.allSongs[widget.index] == myAudio &&
                                  isPlaying
                              ? const Icon(
                                  Icons.pause,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                )),
                    );
                  });
                })
              ],
            ),
            heightbox5,
            AudioFucntions.assetsAudioPlayer.builderCurrent(
                builder: (context, Playing? playing) {
              Audio myAudio = AudioFucntions.find(
                  widget.allSongs, playing!.audio.assetAudioPath);
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: widget.allSongs[widget.index] == myAudio
                      ? AudioFucntions.assetsAudioPlayer
                          .builderRealtimePlayingInfos(
                              builder: (context, RealtimePlayingInfos infos) {
                          Duration currentPos = infos.currentPosition;
                          Duration total = infos.duration;
                          return ProgressBar(
                            barHeight: 1,
                            thumbRadius: 1,
                            timeLabelTextStyle: const TextStyle(fontSize: 0),
                            progress: currentPos,
                            total: total,
                            onSeek: (to) {
                              AudioFucntions.assetsAudioPlayer.seek(to);
                            },
                          );
                        })
                      : const SizedBox());
            })
          ],
        ),
      ),
    );
  }
}
