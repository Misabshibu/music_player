import 'dart:developer';

import '../model/db_functions/db_functions.dart';
import '../model/songsmodel.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AudioFucntions {
  static final AssetsAudioPlayer assetsAudioPlayer =
      AssetsAudioPlayer.withId('0');
  //convert hivemodel  to adudio format
  static List<Audio> convertToAudio() {
    List<Songs> dbSongs = DbFunctions.getSongBox().values.toList();
    List<Audio> convertedAudio = [];

    for (var audio in dbSongs) {
      convertedAudio.add(
        Audio.file(audio.uri.toString(),
            metas: Metas(
              title: audio.title,
              id: audio.id.toString(),
              artist: audio.artist,
            )),
      );
    }
    return convertedAudio;
  }

  //------------------------------------------------------------------------------------//
  //just play and pause at startig time to work assetaudioplayer builder
  static songfirst({required List<Audio> fetchedsongs}) async {
    await assetsAudioPlayer.setVolume(0);

    await assetsAudioPlayer.open(Playlist(audios: fetchedsongs, startIndex: 0),
        // autoStart: true,
        showNotification: false);

    assetsAudioPlayer.pause();
    assetsAudioPlayer.setVolume(1);
  }

  //song play ,pause ,next and prev
  static Future<void> songplayNow(
      {required fetchedaudios, required index}) async {
    // List<Audio> fetchedaudios = [];
    await assetsAudioPlayer.open(
      showNotification: true,
      Playlist(audios: fetchedaudios, startIndex: index),
    );
    assetsAudioPlayer.play();
    log('$index');
  }

  static nextSong() async {
    await Future.delayed(const Duration(milliseconds: 500));
    assetsAudioPlayer.next();
    assetsAudioPlayer.play();
  }

  static prevSong() async {
    await Future.delayed(const Duration(microseconds: 500));
    assetsAudioPlayer.previous();
    assetsAudioPlayer.play();
  }

  //--------------------------------------------------------------------------------------//
  //finding song for current playing
  static Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }
}
