import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spider_tech/Widgets/reels_controls.dart';
import 'package:spider_tech/Widgets/reels_user_interaction.dart';
import 'package:spider_tech/Widgets/reels_video_widget.dart';
import 'package:spider_tech/Widgets/title.dart';

import '../Cubit/Reels_cubit/reels_cubit.dart';
import '../Models/content_model.dart';

class ReelsPageView extends StatelessWidget {
  final List<ContentModel> reels;

  const ReelsPageView({super.key, required this.reels});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: reels.length,
      onPageChanged: (index) => context
          .read<ReelsCubit>()
          .onPageChanged(index, reels.map((e) => e.video).toList()),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            ReelsVideoWidget(videoIndex: index),
            const ReelsControls(),
            const TitLe(),
            ReelsUserInteraction(likesCount: reels[index].likesCount),
          ],
        );
      },
    );
  }
}
