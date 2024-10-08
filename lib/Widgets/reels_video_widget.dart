import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spider_tech/Cubit/Reels_cubit/reels_cubit.dart';
import 'package:spider_tech/Cubit/Reels_cubit/reels_state.dart';

class ReelsVideoWidget extends StatelessWidget {
  final int videoIndex;

  const ReelsVideoWidget({super.key, required this.videoIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ReelsCubit>(context).togglePlayPause();
      },
      child: BlocBuilder<ReelsCubit, ReelsState>(
        builder: (context, state) {
          if (state is ReelsLoading) {
            return const Center(
              child: SpinKitThreeBounce(
                color: Colors.white,
                size: 50.0,
              ),
            );
          } else if (state is ReelsError) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else if (state is ReelsVideoLoaded) {
            return SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: state.videoController.value.size.width,
                  height: state.videoController.value.size.height,
                  child: CachedVideoPlayerPlus(state.videoController),
                ),
              ),
            );
          } else {
            return const Center(
              child: SpinKitThreeBounce(
                color: Colors.white,
                size: 50.0,
              ),
            );
          }
        },
      ),
    );
  }
}
