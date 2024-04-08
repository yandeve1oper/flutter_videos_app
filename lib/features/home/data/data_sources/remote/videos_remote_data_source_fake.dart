import 'videos_remote_data_source.dart';

class VideosRemoteDataSourceFake implements VideosRemoteDataSource {
  @override
  Future<List> fetchVideos({required int limit, required int offset}) {
    // TODO: implement fetchVideos
    throw UnimplementedError();
  }
}
