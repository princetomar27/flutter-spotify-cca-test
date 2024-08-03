import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  return SizedBox(
                    width: 280,
                    child: Column(children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                '${AppUrls.fireStorageURL}${newsSongs[index].artist} - ${newsSongs[index].title}.jpg?${AppUrls.altMedia}',
                              ),
                            ),
                          ),
                        ),
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
