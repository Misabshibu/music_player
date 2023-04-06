import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class PlaylistsHomeList extends StatelessWidget {
  const PlaylistsHomeList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.height * 0.18,
            width: size.width,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width * 0.6,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage('assets/gif/playlist_gif.gif'),
                                  fit: BoxFit.cover),
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: size.width * 0.6,
                            height: size.height * 0.07,
                            child: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Playlist ',
                                    style:
                                        TextStyle(fontSize: size.width * 0.06),
                                  ),
                                  Text(
                                    'Songs 4',
                                    style:
                                        TextStyle(fontSize: size.width * 0.04),
                                  )
                                ],
                              ),
                            ),
                          ).asGlass(
                              tintColor:
                                  const Color.fromARGB(255, 242, 242, 245),
                              clipBorderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
