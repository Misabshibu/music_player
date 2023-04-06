import 'package:audio_music_player/core/constants.dart';
import 'package:audio_music_player/screens/home%20screen/home_screen.dart';
import 'package:audio_music_player/widgets/songlist_widget_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeSongLists extends StatelessWidget {
  const HomeSongLists({
    Key? key,
  }) : super(key: key);

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
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return SongListWidgetHome(size: size);
                  },
                  separatorBuilder: ((context, index) => heightbox10),
                ),
              ),
            ])));
  }
}
