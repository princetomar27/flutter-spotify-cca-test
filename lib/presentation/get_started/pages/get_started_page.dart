import 'package:flutter/material.dart';
import 'package:spotifyclone/common/helpers/navigation_helpers.dart';
import 'package:spotifyclone/common/widgets/main_app_button_widget.dart';
import 'package:spotifyclone/core/assets/app_images.dart';
import 'package:spotifyclone/core/assets/app_vectors.dart';
import 'package:svg_flutter/svg.dart';

import '../../choose_mode/pages/choose_theme_mode_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.introBG,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                Spacer(),
                const Text(
                  "Enjoy Listening To Music",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  "Enjoy endless music with Spotify Clone.\nDiscover, create playlists, and stream your favourite songs & artists seamlessly.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 21,
                ),
                MainAppButtonWidget(
                    buttonText: "Get Started",
                    onButtonPressed: () {
                      nextScreen(context, const ChooseThemeModePage());
                    },
                    buttonHeight: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
