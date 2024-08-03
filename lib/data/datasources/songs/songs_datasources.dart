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
      List<SongsEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var element in data.docs) {
        var songModel = SongsModel.fromJson(element.data());

        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      print(e);
      return const Left('An error occurred, Please try again.');
    }
  }
}
