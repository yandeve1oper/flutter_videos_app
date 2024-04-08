import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_videos_app/features/home/domain/entities/video_entity.dart';
import 'package:flutter_videos_app/features/home/domain/use_cases/get_videos_use_case.dart';

part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  final GetVideosUseCase _getVideosUseCase;

  VideosCubit({
    required GetVideosUseCase getVideosUseCase,
  })  : _getVideosUseCase = getVideosUseCase,
        super(const VideosState());

  void _setVideos(List<VideoFileEntity>? value) {
    emit(state.copyWith(list: value));
  }

  void _setLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  Future<void> getVideos({bool refresh = false}) async {
    final offset = refresh ? 0 : state.list?.length ?? 0;
    final isEmpty = offset == 0;
    final fromCache = state.list == null;

    if (!refresh && isEmpty) {
      _setLoading(true);
    }

    await _getVideosUseCase
        .call(limit: 10, offset: offset, fromCache: fromCache)
        .forEach((data) {
      if (data != null) {
        _setVideos(data);
      }
    });

    _setLoading(false);
  }
}