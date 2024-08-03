import 'package:dartz/dartz.dart';

import '../../../data/models/authentication/create_user_request_body_model.dart';
import '../../../data/models/authentication/sign_in_user_request_body_model.dart';

abstract class AuthRepository {
  Future<Either> signUpUser(CreateUserRequestBodyModel user);

  Future<Either> signInUser(SignInUserRequestBodyModel user);

  Future<Either> isUserLoggedIn();
}
