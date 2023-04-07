import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../core/constants.dart';
import '../../../widgets/songlist_widget_home.dart';
import '../../home%20screen/home_screen.dart';

class HomeSongLists extends StatelessWidget {
  const HomeSongLists({Key? key, required this.allsongs}) : super(key: key);
  final List<Audio> allsongs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
        child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: ListView(children: [
              heightbox20,
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: allsongs.length,
                  itemBuilder: (context, index) {
                    return SongListWidgetHome(
                      size: size,
                      allSongs: allsongs,
                      index: index,
                    );
                  },
                  separatorBuilder: ((context, index) => heightbox10),
                ),
              ),
            ])));
  }
}
