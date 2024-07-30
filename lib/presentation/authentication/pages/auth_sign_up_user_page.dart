import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/injection_container.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../common/helpers/is_dark_theme_helper.dart';
import '../../../../common/helpers/navigation_helpers.dart';
import '../../../../common/widgets/app_bar/main_app_bar_widget.dart';
import '../../../../common/widgets/main_app_button_widget.dart';
import '../../../../core/assets/app_vectors.dart';
import '../../../data/models/authentication/create_user_request_body_model.dart';
import '../../../domain/usecases/authentication/auth_sign_up_usecase.dart';
import '../../home/pages/home_page.dart';
import 'auth_sign_in_user_page.dart';

class AuthSignUpPage extends StatefulWidget {
  const AuthSignUpPage({super.key});

  @override
  State<AuthSignUpPage> createState() => _AuthSignUpPageState();
}

class _AuthSignUpPageState extends State<AuthSignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
      bottomNavigationBar: _signInText(context),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        alignment: Alignment.center,
        child: Column(children: [
          const Text(
            "Register",
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
            controller: _fullNameController,
            decoration: const InputDecoration(hintText: "Full Name")
                .applyDefaults(Theme.of(context).inputDecorationTheme),
          ),

          // Email tf

          const SizedBox(
            height: 20,
          ),

          // Name tf
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: "Enter Email")
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
            buttonText: 'Create Account',
            onButtonPressed: () async {
              CreateUserRequestBodyModel userBody = CreateUserRequestBodyModel(
                email: _emailController.text.trim(),
                fullName: _fullNameController.text.trim(),
                password: _passwordController.text.trim(),
              );
              var signUpResult = await sl<AuthSignUpUsecase>().call(userBody);

              signUpResult.fold(
                (failure) {
                  print("Failure : " + failure);
                },
                (signUpSuccess) {
                  nextScreenRemoveUntil(context, HomePage());
                },
              );
            },
          ),
        ]),
      ),
    );
  }

  Widget _signInText(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Do You have an Account?',
            style: TextStyle(
              color: ctx.isDarkMode ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ' Sign In',
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
