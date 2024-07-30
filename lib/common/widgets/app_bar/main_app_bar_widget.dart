import 'package:flutter/material.dart';
import 'package:spotifyclone/common/helpers/is_dark_theme_helper.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? appBarTitle;
  final bool? leadingVisible;
  const MainAppBarWidget(
      {super.key, this.appBarTitle, this.leadingVisible = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: leadingVisible == true
          ? IconButton(
              icon: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.05)
                      : Colors.black.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                  size: 15,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      centerTitle: true,
      title: appBarTitle ?? const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
