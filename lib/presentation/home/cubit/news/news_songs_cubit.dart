import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/songs/songs_entity.dart';
import '../../../../domain/usecases/songs/fetch_news_songs_usecase.dart';

part 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  final FetchNewsSongsUsecase newsSongsUsecase;

  NewsSongsCubit({required this.newsSongsUsecase}) : super(NewsSongsLoading());

  Future<void> fetchNewsSongs() async {
    var newsSongs = await newsSongsUsecase.call(null);

    newsSongs.fold(
      (l) => emit(NewsSongsFailed()),
      (songs) => emit(
        NewsSongsLoaded(
          newsSongs: songs,
        ),
      ),
    );
  }
}
