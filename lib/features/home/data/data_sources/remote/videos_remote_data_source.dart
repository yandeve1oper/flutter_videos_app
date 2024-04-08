import 'package:flutter_videos_app/features/home/data/models/video_file_model.dart';

abstract class VideosRemoteDataSource {
  Future<List<VideoFileModel>> fetchVideos({
    required int limit,
    required int offset,
  });
}
