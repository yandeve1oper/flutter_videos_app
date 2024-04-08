import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
  late final VideoPlayerController _controller;
  ChewieController? _chewieController;

  bool get _isInitialized =>
      _chewieController?.videoPlayerController.value.isInitialized ?? false;

  @override
  void initState() {
    _initPlayer();
    super.initState();
  }

  Future<void> _initPlayer() async {
    _controller = VideoPlayerController.asset(
      'assets/videos/853751-hd_1920_1080_25fps.mp4',
    );
    await _controller.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
    );

    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (_isInitialized) {
      widget = AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(controller: _chewieController!),
      );
    } else {
      widget = Container(
        color: Colors.grey,
        child: const Icon(Icons.play_circle, size: 66),
      );
    }

    return AspectRatio(aspectRatio: 16 / 9, child: widget);
  }
}
