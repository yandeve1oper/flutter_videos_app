import 'package:flutter_videos_app/features/home/domain/repositories/videos_repository.dart';

import '../entities/video_entity.dart';

class GetRelatedVideosUseCase {
  final VideosRepository videosRepository;

  GetRelatedVideosUseCase({required this.videosRepository});

  Future<List<VideoFileEntity>?> call({
    required int limit,
    required int offset,
    required String? id,
    required String? category,
  }) {
    try {
      final res = videosRepository.getRelatedVideos(
        limit: limit,
        offset: offset,
        id: id,
        category: category,
      );

      return res;
    } catch (error) {
      throw Exception(error);
    }
  }
}
