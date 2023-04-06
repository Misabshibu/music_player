import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_music_player/functions/audio_functions.dart';
import 'package:audio_music_player/model/songsmodel.dart';
import 'package:audio_music_player/screens/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

import '../model/db_functions/db_functions.dart';

class SplashFunctions {
  static OnAudioQuery audioQuery = OnAudioQuery();
  static List<SongModel> deviceSongs = [];
  static Box<List> playlistBox = DbFunctions.getPlaylistBox();
  static Box<Songs> songBox = DbFunctions.getSongBox();
  static List<SongModel> fetchedSongs = [];

  //-----------------------------------------------------------------------//

  //creating playlist for favourites
  static Future getFavSongs() async {
    if (!playlistBox.keys.contains('Favourites')) {
      await playlistBox.put('Favourites', []);
    }
  }

  //creating playlist for most played
  static Future getMostPlayedSongs() async {
    if (!playlistBox.keys.contains('Most Played')) {
      await playlistBox.put('Most Played', []);
    }
  }

  //creating playlist for recent
  static Future getRecentSongs() async {
    if (!playlistBox.keys.contains('Recent')) {
      await playlistBox.put('Recent', []);
    }
  }

  //______________________________________________________________________//

  //fetching the songs from devise and adding to hive database
  static fetchSongs() async {
    //fetcing all device songs
    deviceSongs = await audioQuery.querySongs(
      sortType: SongSortType.TITLE,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    for (var song in deviceSongs) {
      if (song.fileExtension == 'mp3') {
        fetchedSongs.add(song);
      }
    }
    //adding all device song into hive
    for (var audio in fetchedSongs) {
      final song = Songs(
        id: audio.id.toString(),
        title: audio.displayNameWOExt,
        artist: audio.artist!,
        uri: audio.uri!,
      );
      await songBox.put(song.id, song);
    }

    getFavSongs();
    getMostPlayedSongs();
    getRecentSongs();
  }

  //______________________________________________________________________//

  //navigating to home page from splash screen
  static goToHomepage({required context}) async {
    List<Audio> convertedAudios = [];
    await Permission.storage.request();
    await fetchSongs();
    convertedAudios = AudioFucntions.convertToAudio();

    await Future.delayed(const Duration(seconds: 5));
    AudioFucntions.songfirst(fetchedsongs: convertedAudios);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ScreenHome(convertedAudios: convertedAudios)));
  }
}
