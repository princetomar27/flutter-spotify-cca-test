import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/authentication/create_user_request_body_model.dart';
import '../../models/authentication/sign_in_user_request_body_model.dart';

abstract class AuthService {
  Future<Either> signUpUser(CreateUserRequestBodyModel user);

  Future<Either> signInUser(SignInUserRequestBodyModel user);

  Future<Either> isUserLoggedIn();
}

class AuthServiceImpl extends AuthService {
  final SharedPreferences sharedPreferences;
  AuthServiceImpl({required this.sharedPreferences});

  @override
  Future<Either> signInUser(SignInUserRequestBodyModel user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      sharedPreferences.setBool("isUserLoggedIn", true);

      return right('Logged In Successfully !');
    } on FirebaseAuthException catch (err) {
      print(err);
      String msg = '';
      if (err.code == 'invalid-email') {
        msg = 'Email is invalid';
      } else if (err.code == 'wrong-password') {
        msg = 'Try with a different password';
      }

      return left(msg);
    }
  }

  @override
  Future<Either> signUpUser(CreateUserRequestBodyModel user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      FirebaseFirestore.instance.collection('Users').doc(data.user?.uid).set({
        'name': user.fullName,
        'email': user.email,
      });

      sharedPreferences.setBool("isUserLoggedIn", true);
      return right('Account Created Successfully !');
    } on FirebaseAuthException catch (err) {
      String msg = '';
      print(err.code);
      if (err.code == 'weak-password') {
        msg = 'Provided password is too weak!';
      } else if (err.code == 'email-already-in-use') {
        msg = 'An account already exists with same email.';
      }

      return left(msg);
    }
  }

  @override
  Future<Either> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    bool status = await prefs.getBool("isUserLoggedIn") ?? false;
    if (status == true) {
      return right(true);
    } else {
      return left(false);
    }
  }
}
