import 'package:flutter_videos_app/features/home/data/data_sources/remote/videos_remote_data_source.dart';
import 'package:flutter_videos_app/features/home/domain/entities/video_entity.dart';
import 'package:flutter_videos_app/features/home/domain/repositories/videos_repository.dart';

class VideosRepositoryImpl implements VideosRepository {
  final VideosRemoteDataSource remoteDataSource;
  final List<VideoFileEntity> _cachedVideos = [];

  VideosRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<VideoFileEntity>?> getVideos({
    required int limit,
    required int offset,
    bool fromCache = false,
  }) async* {
    try {
      if (fromCache && _cachedVideos.isNotEmpty) {
        yield _cachedVideos;
        return;
      }

      final res = await remoteDataSource.fetchVideos(
        limit: limit,
        offset: offset,
      );

      if (res == null) {
        yield null;
      }

      final entityList = res!.map((e) => e.toEntity());

      if (offset == 0) {
        _cachedVideos
          ..clear()
          ..addAll(entityList);
      }

      yield entityList.toList();
    } catch (e) {
      yield null;
    }
  }

  @override
  Future<List<VideoFileEntity>?> getRelatedVideos({
    required int limit,
    required int offset,
    required String? id,
    required String? category,
  }) async {
    try {
      final res = await remoteDataSource.fetchRelatedVideos(
        limit: limit,
        offset: offset,
        id: id,
        category: category,
      );

      if (res != null) {
        final entityList = res.map((e) => e.toEntity());

        return entityList.toList();
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
