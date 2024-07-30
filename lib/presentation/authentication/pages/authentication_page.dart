import 'package:flutter/material.dart';
import 'package:spotifyclone/common/helpers/is_dark_theme_helper.dart';
import 'package:spotifyclone/common/helpers/navigation_helpers.dart';
import 'package:spotifyclone/common/widgets/app_bar/main_app_bar_widget.dart';
import 'package:spotifyclone/common/widgets/main_app_button_widget.dart';
import 'package:spotifyclone/core/assets/app_images.dart';
import 'package:spotifyclone/core/assets/app_vectors.dart';
import 'package:svg_flutter/svg.dart';

import 'auth_sign_in_user_page.dart';
import 'auth_sign_up_user_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MainAppBarWidget(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBG,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 35,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppVectors.logo,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Enjoy Listening To Music",
                  style: TextStyle(
                    color: context.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  "Spotify is a proprietary Swedish audio streaming and media services provider ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MainAppButtonWidget(
                        buttonText: 'Register',
                        onButtonPressed: () {
                          nextScreenReplace(context, const AuthSignUpPage());
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            nextScreenReplace(context, const AuthSignInPage());
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
