import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/domain/usecases/songs/fetch_news_songs_usecase.dart';
import 'package:spotifyclone/presentation/home/cubit/news/news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  final FetchNewsSongsUsecase newsSongsUsecase;

  NewsSongsCubit({required this.newsSongsUsecase}) : super(NewsSongsLoading());

  // Function to fetch the news songs
  Future<void> fetchNewsSongs() async {
    var newsSongs = await newsSongsUsecase.call(null);

    newsSongs.fold(
      (l) => emit(NewsSongsFailed()),
      (songs) => emit(
        NewsSongsLoaded(
          songs: songs,
        ),
      ),
    );
  }
}
