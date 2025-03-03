import 'package:dartz/dartz.dart';
import 'package:spotifyclone/data/datasources/songs/songs_datasources.dart';
import 'package:spotifyclone/domain/repository/songs/songs_repository.dart';

import '../../../injection_container.dart';

class SongsRepositoryImpl extends SongsRepository {
  final SongsDatasourcesFirebaseService dataSource;

  SongsRepositoryImpl({required this.dataSource});

  @override
  Future<Either> fetchNewsSongs() async {
    return await sl<SongsDatasourcesFirebaseService>().fetchNewsSongs();
  }

  @override
  Future<Either> fetchPlaylists() async {
    return await sl<SongsDatasourcesFirebaseService>().fetchPlaylists();
  }
}
