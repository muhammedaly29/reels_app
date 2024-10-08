import 'package:cached_video_player_plus/cached_video_player_plus.dart';

abstract class ReelsState {}

class ReelsInitial extends ReelsState {}

class ReelsLoading extends ReelsState {}

class ReelsVideoLoaded extends ReelsState {
  final CachedVideoPlayerPlusController videoController;
  final bool isPlaying;
  final bool showControls;

  ReelsVideoLoaded({
    required this.videoController,
    required this.isPlaying,
    required this.showControls,
  });
}

class ReelsNextVideoLoaded extends ReelsState {
  final CachedVideoPlayerPlusController nextVideoController;

  ReelsNextVideoLoaded(this.nextVideoController);
}

class ReelsError extends ReelsState {
  final String error;

  ReelsError(this.error);
}
