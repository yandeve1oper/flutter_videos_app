import '../entities/video_entity.dart';

abstract class VideosRepository {
  Stream<List<VideoFileEntity>?> getVideos({
    required int limit,
    required int offset,
    bool fromCache,
  });
}
