import 'package:audio_music_player/widgets/common_appbar.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class NowplayingAppbar extends StatelessWidget {
  const NowplayingAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
      title: 'Now Playing',
      leadingWidget: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
      actionWidgets: const [
        Icon(Icons.lyrics_outlined),
        widthbox10,
        Icon(Icons.more_vert_outlined),
        widthbox10
      ],
    );
  }
}
