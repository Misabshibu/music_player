import 'package:audio_music_player/core/constants.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class SongListWidgetHome extends StatefulWidget {
  const SongListWidgetHome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<SongListWidgetHome> createState() => _SongListWidgetHomeState();
}

class _SongListWidgetHomeState extends State<SongListWidgetHome>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
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
        miniPlayerBottomsheet(
          context: context,
          size: widget.size,
          animationController: animationController,
          funcbutton: () {
            setState(() {
              animationController.reset();
            });
          },
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
                Container(
                  width: widget.size.width * 0.15,
                  height: widget.size.width * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                ),
                widthbox20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widget.size.width * 0.35,
                      child: const Text(
                        'namejjhgjhgjhghg',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    heightbox5,
                    SizedBox(
                      width: widget.size.width * 0.35,
                      child: const Text(
                        'name',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
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
                const Card(
                  child: Icon(
                    Icons.play_arrow,
                    size: 30,
                  ),
                )
              ],
            ),
            heightbox5,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ProgressBar(
                  barHeight: 2,
                  thumbRadius: 1,
                  timeLabelTextStyle: TextStyle(fontSize: 0),
                  progress: Duration(seconds: 0),
                  total: Duration(minutes: 5)),
            )
          ],
        ),
      ),
    );
  }
}

//Mini player Function
miniPlayerBottomsheet(
    {required BuildContext context,
    required Size size,
    required animationController,
    required void Function() funcbutton}) {
  showBottomSheet(
      backgroundColor: const Color.fromARGB(0, 218, 202, 202),
      enableDrag: false,
      elevation: 0,
      context: context,
      builder: (context) {
        return Padding(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'datasadsa',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'datadsa',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  ProgressBar(
                                      barHeight: 3,
                                      thumbRadius: 3,
                                      timeLabelTextStyle:
                                          TextStyle(fontSize: 0),
                                      progress: Duration(seconds: 0),
                                      total: Duration(seconds: 10))
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
                            child: const Icon(
                          Icons.skip_previous_sharp,
                          size: 35,
                        )),
                        widthbox20,
                        GestureDetector(
                          onTap: funcbutton,
                          child: const Card(
                            child: Icon(
                              Icons.play_arrow,
                              size: 35,
                            ),
                          ),
                        ),
                        widthbox20,
                        GestureDetector(
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
                          child: const CircleAvatar(
                            radius: 38.0,
                            backgroundImage: NetworkImage(
                              'https://i.pinimg.com/564x/eb/26/bd/eb26bdbeb5c7fae05ff44734cc995a5e.jpg',
                            ),
                            child: Center(
                              child: CircleAvatar(
                                radius: 8,
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
        );
      });
}
