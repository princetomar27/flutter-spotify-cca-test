import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotifyclone/data/datasources/songs/songs_datasources.dart';
import 'package:spotifyclone/domain/repository/songs/songs_repository.dart';
import 'package:spotifyclone/domain/usecases/authentication/user_logged_in_usecase.dart';
import 'package:spotifyclone/domain/usecases/songs/fetch_news_songs_usecase.dart';
import 'package:spotifyclone/domain/usecases/songs/fetch_playlists.dart';
import 'data/repository/authentication/auth_repository_impl.dart';
import 'data/repository/songs/songs_repository_impl.dart';
import 'domain/usecases/authentication/auth_sign_in_usecase.dart';
import 'domain/usecases/authentication/auth_sign_up_usecase.dart';
import 'data/datasources/authentication/auth_service.dart';
import 'domain/repository/authentication/auth_repository.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Ensure to register all dependencies in the correct order
  await registerDatasources();
  registerRepositories();
  registerUseCases();
}

Future<void> registerDatasources() async {
  // Register SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register AuthServiceImpl with the previously registered SharedPreferences
  sl.registerSingleton<AuthService>(
    AuthServiceImpl(sharedPreferences: sl<SharedPreferences>()),
  );

  // Register Firebase service
  sl.registerSingleton<SongsDatasourcesFirebaseService>(
    SongsDatasourcesFirebaseServiceImpl(
      firestore: FirebaseFirestore.instance,
    ),
  );
}

void registerRepositories() {
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      datasource: sl<AuthService>(),
    ),
  );
  sl.registerSingleton<SongsRepository>(
    SongsRepositoryImpl(
      dataSource: sl<SongsDatasourcesFirebaseService>(),
    ),
  );
}

void registerUseCases() {
  sl.registerSingleton<AuthSignUpUsecase>(
    AuthSignUpUsecase(
      authRepository: sl<AuthRepository>(),
    ),
  );

  sl.registerSingleton<AuthSignInUsecase>(
    AuthSignInUsecase(
      authRepository: sl<AuthRepository>(),
    ),
  );

  sl.registerSingleton<AuthUserLoggedInUseCase>(
    AuthUserLoggedInUseCase(
      authRepository: sl<AuthRepository>(),
    ),
  );

  sl.registerSingleton<FetchNewsSongsUsecase>(
    FetchNewsSongsUsecase(
      songsRepository: sl<SongsRepository>(),
    ),
  );

  sl.registerSingleton<FetchPlaylistUsecase>(
    FetchPlaylistUsecase(
      songsRepository: sl<SongsRepository>(),
    ),
  );
}
