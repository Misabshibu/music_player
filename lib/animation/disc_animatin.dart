import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_music_player/widgets/songlist_widget_home.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class DiscAnimation extends StatelessWidget {
  const DiscAnimation({super.key, required this.myAudio, required this.size});

  final Audio myAudio;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  decoration: const BoxDecoration(shape: BoxShape.circle),
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
    );
  }
}
