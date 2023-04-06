import 'package:audio_music_player/model/songsmodel.dart';
import 'package:hive/hive.dart';

class DbFunctions {
  static Box<Songs> getSongBox() {
    return Hive.box<Songs>('songs');
  }

  static Box<List> getPlaylistBox() {
    return Hive.box<List>('playlist');
  }
}
