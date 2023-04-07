import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class NowplayingAppbar extends StatelessWidget {
  const NowplayingAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: const Icon(Icons.arrow_back_rounded),
      title: const Text('Now Playing'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: const [
        Icon(Icons.lyrics_outlined),
        widthbox10,
        Icon(Icons.more_vert_outlined),
        widthbox10
      ],
    );
  }
}
