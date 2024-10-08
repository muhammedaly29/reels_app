import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spider_tech/Cubit/Reels_cubit/reels_cubit.dart';
import 'package:spider_tech/Models/content_model.dart';
import 'package:spider_tech/Services/get_reels.dart';
import 'package:spider_tech/Widgets/reels_page_view.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReelsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: FutureBuilder<List<ContentModel>>(
            future: GetReels().fetchReels(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitThreeBounce(
                    color: Colors.white,
                    size: 50.0,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No videos available'),
                );
              }

              final videoUrls =
                  snapshot.data!.map((content) => content.video).toList();
              return BlocProvider(
                create: (_) =>
                    ReelsCubit()..loadAndPlayCurrentVideo(videoUrls[0]),
                child: ReelsPageView(reels: snapshot.data!),
              );
            },
          ),
        ),
      ),
    );
  }
}
