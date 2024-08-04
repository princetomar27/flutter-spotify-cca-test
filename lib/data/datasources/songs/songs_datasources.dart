import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotifyclone/domain/entities/songs/songs_entity.dart';
import 'package:spotifyclone/data/models/songs/songs_model.dart';

abstract class SongsDatasourcesFirebaseService {
  Future<Either<String, List<SongsEntity>>> fetchNewsSongs();
}

class SongsDatasourcesFirebaseServiceImpl
    implements SongsDatasourcesFirebaseService {
  final FirebaseFirestore firestore;

  SongsDatasourcesFirebaseServiceImpl({required this.firestore});

  @override
  Future<Either<String, List<SongsEntity>>> fetchNewsSongs() async {
    try {
      final data = await firestore
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      final songs = data.docs.map((doc) {
        final songModel = SongsModel.fromJson(doc.data());
        return songModel.toEntity();
      }).toList();

      return Right(songs);
    } catch (e) {
      print(e);
      return Left('An error occurred, Please try again.');
    }
  }
}
