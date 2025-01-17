import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:spotifyclone/common/helpers/navigation_helpers.dart';
import 'package:spotifyclone/core/assets/app_vectors.dart';
import 'package:spotifyclone/domain/usecases/authentication/user_logged_in_usecase.dart';
import 'package:spotifyclone/injection_container.dart';
import 'package:svg_flutter/svg.dart';

import '../../get_started/pages/get_started_page.dart';
import '../../home/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirectUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppVectors.logo,
        ),
      ),
    );
  }

  Future<void> redirectUser() async {
    final authUserLoggedInUseCase = sl<AuthUserLoggedInUseCase>();
    final dartz.Either failureOrLoggedIn =
        await authUserLoggedInUseCase.call(null);
    failureOrLoggedIn.fold(
      (failure) {
        nextScreenRemoveUntil(context, const GetStartedPage());
      },
      (isLoggedIn) {
        Future.delayed(const Duration(seconds: 2), () {
          if (isLoggedIn) {
            nextScreenRemoveUntil(context, const HomePage());
          } else {
            nextScreenRemoveUntil(context, const GetStartedPage());
          }
        });
      },
    );
  }
}
