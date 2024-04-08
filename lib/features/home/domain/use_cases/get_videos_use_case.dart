import 'package:flutter_videos_app/features/home/domain/repositories/videos_repository.dart';

import '../entities/video_entity.dart';

class GetVideosUseCase {
  final VideosRepository videosRepository;

  GetVideosUseCase({required this.videosRepository});

  Stream<List<VideoFileEntity>?> call({
    required int limit,
    required int offset,
    bool fromCache = false,
  }) {
    try {
      final stream = videosRepository.getVideos(
        limit: limit,
        offset: offset,
        fromCache: fromCache,
      );

      return stream;
    } catch (error) {
      throw Exception(error);
    }
  }
}
