import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter_videos_app/features/home/presentation/widgets/video_placeholders.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key, this.path});

  final String? path;

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
    if (widget.path == null) return;

    _controller = VideoPlayerController.asset(widget.path!);
    await _controller.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      errorBuilder: (_, __) => const VideoPlaceholer(),
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
      widget = Chewie(controller: _chewieController!);
    } else {
      widget = const VideoPlaceholer();
    }

    return AspectRatio(aspectRatio: 16 / 9, child: widget);
  }
}
