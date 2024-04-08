import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_videos_app/core/services/thumbnail_service.dart';
import 'package:flutter_videos_app/features/home/data/models/video_file_model.dart';

import 'videos_remote_data_source.dart';

class VideosRemoteDataSourceFake implements VideosRemoteDataSource {
  final ThumbnailService _thumbnailService;

  const VideosRemoteDataSourceFake({
    required ThumbnailService thumbnailService,
  }) : _thumbnailService = thumbnailService;

  @override
  Future<List<VideoFileModel>> fetchVideos({
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await rootBundle.loadString(
        'assets/data_samples/videos_sample.json',
      );
      final result = (json.decode(res) as List<dynamic>).sublist(
        offset,
        offset + limit,
      );

      final mappedList = VideoFileModel.fromJsonList(result).map(
        (model) async {
          if (model.url != null) {
            final previewPath =
                await _thumbnailService.generateThumbnailFromAsset(model.url!);

            return model.copyWithPreview(previewPath);
          }

          return model;
        },
      );

      await Future.delayed(const Duration(seconds: 1));

      return Future.wait(mappedList);
    } catch (e) {
      throw Exception('Videos fetch failed: $e');
    }
  }
}
