import 'package:dartz/dartz.dart';

abstract class SongsRepository {
  Future<Either> fetchNewsSongs();
  Future<Either> fetchPlaylists();
}
