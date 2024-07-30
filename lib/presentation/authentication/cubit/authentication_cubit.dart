import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/models/authentication/create_user_request_body_model.dart';
import '../../../domain/usecases/authentication/auth_sign_up_usecase.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthSignUpUsecase signUpUsecase;
  AuthenticationCubit({required this.signUpUsecase})
      : super(AuthenticationInitial());

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUpUser() async {
    var authResult = await signUpUsecase.call(
      CreateUserRequestBodyModel(
        email: emailController.text.trim(),
        fullName: nameController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    authResult.fold((failure) {
      return Fluttertoast.showToast(msg: failure);
    }, (signUpSuccess) {
      Fluttertoast.showToast(msg: signUpSuccess);

      return null;
    });
  }
}
