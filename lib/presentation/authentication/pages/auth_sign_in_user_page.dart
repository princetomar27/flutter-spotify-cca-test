import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/common/helpers/is_dark_theme_helper.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../common/helpers/navigation_helpers.dart';
import '../../../../common/widgets/app_bar/main_app_bar_widget.dart';
import '../../../../common/widgets/main_app_button_widget.dart';
import '../../../../core/assets/app_vectors.dart';

import '../../../data/models/authentication/sign_in_user_request_body_model.dart';
import '../../../domain/usecases/authentication/auth_sign_in_usecase.dart';
import '../../../injection_container.dart';
import '../../home/pages/home_page.dart';

class AuthSignInPage extends StatefulWidget {
  const AuthSignInPage({super.key});

  @override
  State<AuthSignInPage> createState() => _AuthSignInPageState();
}

class _AuthSignInPageState extends State<AuthSignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarWidget(
        appBarTitle: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
        ),
      ),
      bottomNavigationBar: _registerUserText(context),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        alignment: Alignment.center,
        child: Column(children: [
          const Text(
            "Sign In",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),

          // Name tf
          TextField(
            controller: _emailController,
            decoration:
                const InputDecoration(hintText: "Enter Username or Email")
                    .applyDefaults(Theme.of(context).inputDecorationTheme),
          ),

          const SizedBox(
            height: 20,
          ),

          // Name tf
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: "Password",
            ).applyDefaults(Theme.of(context).inputDecorationTheme),
          ),
          const SizedBox(
            height: 40,
          ),

          MainAppButtonWidget(
            buttonText: 'Log In',
            onButtonPressed: () async {
              SignInUserRequestBodyModel userBody = SignInUserRequestBodyModel(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
              );
              var signInResult = await sl<AuthSignInUsecase>().call(userBody);

              signInResult.fold(
                (failure) {
                  print("FAIL :  $failure");
                },
                (signUpSuccess) {
                  nextScreenRemoveUntil(context, const HomePage());
                },
              );
            },
          ),
        ]),
      ),
    );
  }

  Widget _registerUserText(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Not a Member?',
            style: TextStyle(
              color: ctx.isDarkMode ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ' Register Now',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      nextScreen(
                        ctx,
                        const AuthSignInPage(),
                      );
                    })
            ],
          )),
    );
  }
}
