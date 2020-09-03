import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ConditionalVideoPLayerWidget extends StatefulWidget {
  @override
  _ConditionalVideoPLayerWidgetState createState() =>
      _ConditionalVideoPLayerWidgetState();
}

class _ConditionalVideoPLayerWidgetState
    extends State<ConditionalVideoPLayerWidget> {
  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;
  bool backwardMovement = false;
  bool forwardMovement = false;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
    _chewieController.addListener(chewielistner);
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    _chewieController.dispose();
    _chewieController.pause();
    super.dispose();
  }

  chewielistner() {
    if (_videoPlayerController.value.position.inSeconds >= 1) {
      setState(() {
        forwardMovement = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Chewie(
            controller: _chewieController,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  _chewieController
                      .seekTo(_videoPlayerController.value.position -
                          _videoPlayerController.value.position)
                      .then((onValue) {
                    _chewieController.play();
                  });
                  setState(() {});
                },
                child: Center(
                  child: Text(
                    "Backward",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  _chewieController
                      .seekTo(_videoPlayerController.value.position +
                          _videoPlayerController.value.position)
                      .then((onValue) {
                    _chewieController.play();
                  });
                  setState(() {});
                },
                child: Center(
                  child: Text(
                    "Forward",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
