import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecase/usecase.dart';

import '../../../data/models/authentication/sign_in_user_request_body_model.dart';
import '../../repository/authentication/auth_repository.dart';

class AuthSignInUsecase implements UseCase<Either, SignInUserRequestBodyModel> {
  final AuthRepository authRepository;

  AuthSignInUsecase({required this.authRepository});

  @override
  Future<Either> call(SignInUserRequestBodyModel params) async {
    return authRepository.signInUser(params);
  }
}
