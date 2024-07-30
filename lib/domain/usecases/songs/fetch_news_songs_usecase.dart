import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecase/usecase.dart';
import 'package:spotifyclone/domain/repository/songs/songs_repository.dart';

class FetchNewsSongsUsecase implements UseCase<Either, dynamic> {
  final SongsRepository songsRepository;

  FetchNewsSongsUsecase({required this.songsRepository});

  @override
  Future<Either> call(params) async {
    return await songsRepository.fetchNewsSongs();
  }
}
