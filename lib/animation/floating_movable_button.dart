import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';

class FloatingMovableButton extends StatelessWidget {
  const FloatingMovableButton({super.key, required this.onpressfunc});
  final Function()? onpressfunc;
  @override
  Widget build(BuildContext context) {
    return DraggableFab(
      child: FloatingActionButton.small(
          backgroundColor: const Color(0xff0077b6),
          onPressed: onpressfunc,
          child: const MiniMusicVisualizer(
            color: Color(0xffcaf0f8),
            width: 3,
            height: 20,
          )),
    );
  }
}
