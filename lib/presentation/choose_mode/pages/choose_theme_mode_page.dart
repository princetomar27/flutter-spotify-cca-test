import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../common/helpers/navigation_helpers.dart';
import '../../../../common/widgets/main_app_button_widget.dart';
import '../../../../core/assets/app_images.dart';
import '../../../../core/assets/app_vectors.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../authentication/pages/authentication_page.dart';
import '../cubits/choose_theme_mode_cubit.dart';

class ChooseThemeModePage extends StatelessWidget {
  const ChooseThemeModePage({super.key});

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
                  AppImages.chooseModeBG,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  "Choose Mode",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<AppThemeModeCubit>()
                            .updateAppTheme(ThemeMode.dark);
                      },
                      child: Column(children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              padding: EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF30393C).withOpacity(0.5),
                              ),
                              child: SvgPicture.asset(
                                AppVectors.moon,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Dart Mode",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<AppThemeModeCubit>()
                            .updateAppTheme(ThemeMode.light);
                      },
                      child: Column(children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              padding: EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF30393C).withOpacity(0.5),
                              ),
                              child: SvgPicture.asset(
                                AppVectors.sun,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Light Mode",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 55,
                ),
                MainAppButtonWidget(
                    buttonText: "Continue",
                    onButtonPressed: () {
                      nextScreen(context, const AuthenticationPage());
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
