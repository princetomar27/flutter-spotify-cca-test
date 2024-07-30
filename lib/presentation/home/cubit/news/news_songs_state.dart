import 'package:spotifyclone/domain/entities/songs/songs_entity.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongsEntity> songs;

  NewsSongsLoaded({required this.songs});
}

class NewsSongsFailed extends NewsSongsState {}
