import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../repository/authentication/auth_repository.dart';

class AuthUserLoggedInUseCase implements UseCase<Either, Null> {
  final AuthRepository authRepository;

  AuthUserLoggedInUseCase({required this.authRepository});

  @override
  Future<Either> call(params) async {
    return authRepository.isUserLoggedIn();
  }
}
