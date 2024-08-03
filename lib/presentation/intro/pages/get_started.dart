import 'package:flutter/material.dart';
import 'package:spotifyclone/common/widgets/main_app_button_widget.dart';
import 'package:spotifyclone/core/assets/app_images.dart';
import 'package:spotifyclone/core/assets/app_vectors.dart';
import 'package:spotifyclone/presentation/choose_mode/pages/choose_theme_mode_page.dart';
import 'package:svg_flutter/svg_flutter.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(60),
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
            padding: const EdgeInsets.all(60.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                  ),
                ),
                const Spacer(),
                const Text(
                  "Enjoy Listening To Music",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  "Enjoy endless music with Spotify. \nDiscover, create playlists, and stream your favorite songs seamlessly.",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                MainAppButtonWidget(
                  onButtonPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseThemeModePage()));
                  },
                  buttonText: 'Get Started',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
