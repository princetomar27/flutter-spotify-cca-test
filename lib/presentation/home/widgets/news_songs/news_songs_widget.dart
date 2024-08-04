import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/common/helpers/is_dark_theme_helper.dart';
import 'package:spotifyclone/core/configs/themes/app_colors.dart';
import 'package:spotifyclone/core/constants/app_urls.dart';
import 'package:spotifyclone/injection_container.dart';
import 'package:spotifyclone/presentation/home/cubit/news/news_songs_cubit.dart';

class NewsSongsWidget extends StatelessWidget {
  const NewsSongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit(
        newsSongsUsecase: sl(),
      )..fetchNewsSongs(),
      child: SizedBox(
        height: 208,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                height: 260,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            } else if (state is NewsSongsFailed) {
              return Container(
                height: 200,
                width: 240,
                color: Colors.amber,
              );
            } else if (state is NewsSongsLoaded) {
              final newsSongs = state.newsSongs;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String artist = newsSongs[index].artist.trim();
                  String title = newsSongs[index].title.trim();

                  String imageUrl =
                      '${AppUrls.fireStorageURL}${Uri.encodeComponent(artist)}%20-%20${Uri.encodeComponent(title)}.jpg?alt=media';

                  return SizedBox(
                    width: 280,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    imageUrl,
                                  ),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  transform: Matrix4.translationValues(8, 8, 0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.isDarkMode
                                        ? AppColors.darkGrey
                                        : AppColors.lightGrey,
                                  ),
                                  child: Icon(
                                    CupertinoIcons.play_fill,
                                    color: context.isDarkMode
                                        ? AppColors.newsButtonLightColor
                                        : AppColors.darkGrey,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            artist,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ]),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    width: 14,
                  );
                },
                itemCount: newsSongs.length,
              );
            }
            return Container(
              height: 200,
              width: 240,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
