import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/injection_container.dart';
import 'package:spotifyclone/presentation/home/cubit/news/news_songs_cubit.dart';

import '../../../../common/widgets/molecules/shimmer_item.dart';

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
                child: CircularProgressIndicator(),
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
                  return Container(
                    width: 280,
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(""))),
                      ),
                    ]),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return SizedBox(
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
