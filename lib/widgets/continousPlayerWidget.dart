import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ContinuousVideoPlayer extends StatefulWidget {
  @override
  _ContinuousVideoPlayerState createState() => _ContinuousVideoPlayerState();
}

class _ContinuousVideoPlayerState extends State<ContinuousVideoPlayer> {
  ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
    super.initState();
  }
@override
  void dispose() {
   _chewieController.dispose();
   _chewieController.pause();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
