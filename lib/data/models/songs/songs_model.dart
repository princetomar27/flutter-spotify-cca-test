import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotifyclone/domain/entities/songs/songs_entity.dart';

class SongsModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;

  SongsModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  SongsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    artist = json['artist'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
  }
}

extension SongModelX on SongsModel {
  SongsEntity toEntity() {
    return SongsEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
    );
  }
}
