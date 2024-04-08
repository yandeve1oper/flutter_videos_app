import 'package:flutter/material.dart';

import 'package:flutter_videos_app/features/home/domain/entities/video_entity.dart';

class VideoCard extends StatelessWidget {
  final VideoFileEntity file;

  const VideoCard({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    file.previewUrl ?? '',
                    fit: BoxFit.cover,
                    cacheHeight: 220,
                  ),
                ),
                const Icon(Icons.play_circle, size: 66)
              ],
            ),
            const SizedBox(height: 8),
            Text(
              file.title ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}
