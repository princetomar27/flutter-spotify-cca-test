import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecase/usecase.dart';

import '../../../data/models/authentication/create_user_request_body_model.dart';
import '../../repository/authentication/auth_repository.dart';

class AuthSignUpUsecase implements UseCase<Either, CreateUserRequestBodyModel> {
  final AuthRepository authRepository;

  AuthSignUpUsecase({required this.authRepository});

  @override
  Future<Either> call(CreateUserRequestBodyModel params) async {
    return authRepository.signUpUser(params);
  }
}
