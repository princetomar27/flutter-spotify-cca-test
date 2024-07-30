import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/constants/firebase_constants.dart';
import 'package:spotifyclone/data/models/songs/songs_model.dart';
import 'package:spotifyclone/domain/entities/songs/songs_entity.dart';

abstract class SongsDatasourcesFirebaseService {
  Future<Either> fetchNewsSongs();
}

class SongsDatasourcesFirebaseServiceImpl
    implements SongsDatasourcesFirebaseService {
  final FirebaseFirestore firestore;

  SongsDatasourcesFirebaseServiceImpl({required this.firestore});

  @override
  Future<Either> fetchNewsSongs() async {
    try {
      List<SongsEntity> songs = List.empty();

      var newsSongsData = await firestore
          .collection(AppConstants.songsCollection)
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      newsSongsData.docs.forEach((newsSongs) {
        var songModel = SongsModel.fromJson(newsSongs.data());
        // Now write a extension in song model to convert song model to entity
        songs.add(
          songModel.toEntity(),
        );
      });

      return right(songs);
    } catch (e) {
      return left('An error occured while fetching news songs! $e');
    }
  }
}
