import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit() : super(ReelsInitial());

  CachedVideoPlayerPlusController? _currentVideoController;
  bool _isPlaying = false;
  int _currentIndex = 0;

  CachedVideoPlayerPlusController? get currentVideoController =>
      _currentVideoController;

  Future<void> loadAndPlayCurrentVideo(String videoUrl) async {
    await _initializeVideoController(videoUrl);
    _isPlaying = true;
    emit(ReelsVideoLoaded(
      videoController: _currentVideoController!,
      isPlaying: _isPlaying,
      showControls: false,
    ));
    _currentVideoController!.play();
  }

  Future<void> _initializeVideoController(String videoUrl) async {
    try {
      final file = await DefaultCacheManager().getSingleFile(videoUrl);
      final controller = CachedVideoPlayerPlusController.file(file);
      await controller.initialize();

      _disposeController(_currentVideoController);
      _currentVideoController = controller;
    } catch (error) {
      emit(ReelsError("Error loading video: $error"));
    }
  }

  // Play the next video
  void playNextVideo(List<String> videoUrls) {
    if (_currentIndex + 1 < videoUrls.length) {
      _currentIndex++;
      loadAndPlayCurrentVideo(videoUrls[_currentIndex]); 
    }
  }

  // Play the previous video
  void playPreviousVideo(List<String> videoUrls) {
    if (_currentIndex - 1 >= 0) {
      _currentIndex--;
      loadAndPlayCurrentVideo(
          videoUrls[_currentIndex]);
    }
  }

 
  void onPageChanged(int index, List<String> videoUrls) {
    _currentIndex = index;
    loadAndPlayCurrentVideo(videoUrls[index]);
  }

  
  void togglePlayPause() {
    if (_isPlaying) {
      _currentVideoController?.pause();
    } else {
      _currentVideoController?.play();
    }
    _isPlaying = !_isPlaying;
    emit(ReelsVideoLoaded(
      videoController: _currentVideoController!,
      isPlaying: _isPlaying,
      showControls: !_isPlaying,
    ));
  }

  
  void _disposeController(CachedVideoPlayerPlusController? controller) {
    controller?.dispose();
  }

  @override
  Future<void> close() {
    _disposeController(_currentVideoController);
    return super.close();
  }
}
