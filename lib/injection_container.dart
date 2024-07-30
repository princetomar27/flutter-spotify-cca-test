import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:spotifyclone/data/datasources/songs/songs_datasources.dart';
import 'package:spotifyclone/domain/repository/songs/songs_repository.dart';
import 'package:spotifyclone/domain/usecases/songs/fetch_news_songs_usecase.dart';
import 'data/repository/authentication/auth_repository_impl.dart';
import 'data/repository/songs/songs_repository_impl.dart';
import 'domain/usecases/authentication/auth_sign_in_usecase.dart';
import 'domain/usecases/authentication/auth_sign_up_usecase.dart';

import 'data/datasources/authentication/auth_service.dart';
import 'domain/repository/authentication/auth_repository.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  registerDatasources();
  registerRepositories();
  registerUseCases();
}

void registerDatasources() {
  sl.registerSingleton<AuthService>(
    AuthServiceImpl(),
  );

  sl.registerSingleton<SongsDatasourcesFirebaseService>(
    SongsDatasourcesFirebaseServiceImpl(
      firestore: FirebaseFirestore.instance,
    ),
  );
}

void registerRepositories() {
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      datasource: sl(),
    ),
  );
  sl.registerSingleton<SongsRepository>(
    SongsRepositoryImpl(
      dataSource: sl(),
    ),
  );
}

void registerUseCases() {
  sl.registerSingleton<AuthSignUpUsecase>(
    AuthSignUpUsecase(
      authRepository: sl(),
    ),
  );

  sl.registerSingleton<AuthSignInUsecase>(
    AuthSignInUsecase(
      authRepository: sl(),
    ),
  );

  sl.registerSingleton<FetchNewsSongsUsecase>(FetchNewsSongsUsecase(
    songsRepository: sl(),
  ));
}
