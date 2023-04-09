import 'package:audio_music_player/widgets/common_appbar.dart';
import 'package:flutter/material.dart';

class DefaultPlaylists extends StatelessWidget {
  const DefaultPlaylists({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CommonAppbar(
              leadingWidget: InkWell(child: Icon(Icons.arrow_back_ios_new)),
              title: '',
              actionWidgets: [])),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.15,
                  color: Colors.red,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                    const Text('29 Songs'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
