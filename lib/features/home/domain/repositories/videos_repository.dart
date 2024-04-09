import '../entities/video_entity.dart';

abstract class VideosRepository {
  Stream<List<VideoFileEntity>?> getVideos({
    required int limit,
    required int offset,
    bool fromCache,
  });

  Future<List<VideoFileEntity>?> getRelatedVideos({
    required int limit,
    required int offset,
    required String? id,
    required String? category,
  });
}
