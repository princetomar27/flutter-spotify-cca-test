import 'package:dartz/dartz.dart';

import '../../../domain/repository/authentication/auth_repository.dart';
import '../../datasources/authentication/auth_service.dart';
import '../../models/authentication/create_user_request_body_model.dart';
import '../../models/authentication/sign_in_user_request_body_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService datasource;
  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either> signInUser(SignInUserRequestBodyModel user) async {
    return await datasource.signInUser(user);
  }

  @override
  Future<Either> signUpUser(CreateUserRequestBodyModel user) async {
    return await datasource.signUpUser(user);
  }
}
