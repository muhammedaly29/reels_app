import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spider_tech/Cubit/Reels_cubit/reels_cubit.dart';
import 'package:spider_tech/Cubit/Reels_cubit/reels_state.dart';

class ReelsControls extends StatelessWidget {
  const ReelsControls({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReelsCubit, ReelsState>(
      builder: (context, state) {
        if (state is ReelsVideoLoaded && state.showControls) {
          return Center(
            child: IconButton(
              icon: Icon(
                state.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () {
                BlocProvider.of<ReelsCubit>(context).togglePlayPause();
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
