abstract class VideosRemoteDataSource {
  Future<List> fetchVideos({required int limit, required int offset});
}
