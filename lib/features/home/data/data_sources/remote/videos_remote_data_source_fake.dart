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

  Future<List<dynamic>> _loadFakeData() async {
    final res = await rootBundle.loadString(
      'assets/data_samples/videos_sample.json',
    );

    return json.decode(res) as List<dynamic>;
  }

  Iterable<Future<VideoFileModel>> _getDataWithPreview(List<dynamic> jsonList) {
    return VideoFileModel.fromJsonList(jsonList).map(
      (model) async {
        if (model.url != null) {
          final previewPath =
              await _thumbnailService.generateThumbnailFromAsset(model.url!);

          return model.copyWithPreview(previewPath);
        }

        return model;
      },
    );
  }

  @override
  Future<List<VideoFileModel>?> fetchVideos({
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _loadFakeData();
      final edge = offset + limit;
      final end = edge >= res.length ? res.length : edge;
      final resSublist = res.sublist(offset, end);

      await Future.delayed(const Duration(seconds: 1));

      return Future.wait(_getDataWithPreview(resSublist));
    } catch (e) {
      throw Exception('Videos fetch failed: $e');
    }
  }

  @override
  Future<List<VideoFileModel>?> fetchRelatedVideos({
    required int limit,
    required int offset,
    required String? id,
    required String? category,
  }) async {
    try {
      final res = await _loadFakeData();
      final filteredRes = res.where((e) {
        return e['category'] == category && e['id'] != id;
      }).toList();
      final edge = offset + limit;
      final end = edge >= filteredRes.length ? filteredRes.length : edge;
      final resSublist = filteredRes.sublist(offset, end);

      return Future.wait(_getDataWithPreview(resSublist));
    } catch (e) {
      throw Exception('Videos fetch failed: $e');
    }
  }
}
