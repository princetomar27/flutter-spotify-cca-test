part of 'news_songs_cubit.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongsEntity> newsSongs;

  NewsSongsLoaded({required this.newsSongs});
}

class NewsSongsFailed extends NewsSongsState {}
