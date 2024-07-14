import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/helpers/is_dark_theme.dart';
import 'package:spotifyclone/common/helpers/navigation_methods.dart';
import 'package:spotifyclone/common/widgets/app_bar/app_bar.dart';
import 'package:spotifyclone/common/widgets/button/main_app_button.dart';
import 'package:spotifyclone/core/assets/app_vectors.dart';
import 'package:spotifyclone/presentation/authentication/pages/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: _signUpText(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(
              height: 50,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            MainAppButton(
              onPressed: () {},
              title: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      "Sign In",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Enter Email",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Password",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(
            color: context.isDarkMode ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Register',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  nextScreenReplace(context, const SignUpPage());
                },
            ),
          ],
        ),
      ),
    );
  }
}
