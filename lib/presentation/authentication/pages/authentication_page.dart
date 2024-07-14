import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/helpers/is_dark_theme.dart';
import 'package:spotifyclone/common/helpers/navigation_methods.dart';
import 'package:spotifyclone/common/widgets/button/main_app_button.dart';
import 'package:spotifyclone/core/assets/app_images.dart';
import 'package:spotifyclone/core/assets/app_vectors.dart';
import 'package:spotifyclone/presentation/authentication/pages/sign_in_page.dart';
import 'package:spotifyclone/presentation/authentication/pages/sign_up_page.dart';

import '../../../common/widgets/app_bar/app_bar.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomAppBar(),
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
            padding: EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppVectors.logo,
                ),
                const SizedBox(
                  height: 55,
                ),
                Text(
                  "Enjoy Listening To Music",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  "Spotify is a proprietary Swedish audio streaming and media services provider ",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 21,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MainAppButton(
                        onPressed: () {
                          nextScreen(
                            context,
                            const SignUpPage(),
                          );
                        },
                        title: 'Register',
                      ),
                    ),
                    const SizedBox(
                      width: 89,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          nextScreen(
                            context,
                            const SignInPage(),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
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
