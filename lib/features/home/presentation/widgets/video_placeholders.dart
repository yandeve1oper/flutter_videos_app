import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VideoPlaceholer extends StatelessWidget {
  const VideoPlaceholer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade50,
              child: Container(color: Colors.grey.shade300),
            ),
          ),
          const Icon(Icons.play_circle, size: 68)
        ],
      ),
    );
  }
}

class VideoCardPlaceholer extends StatelessWidget {
  const VideoCardPlaceholer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const VideoPlaceholer(),
      const SizedBox(height: 8),
      Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade50,
        child: Container(
          color: Colors.grey.shade300,
          height: 42,
          width: width / 3,
        ),
      ),
      const SizedBox(height: 16),
    ]);
  }
}
