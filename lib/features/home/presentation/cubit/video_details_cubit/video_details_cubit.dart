import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_videos_app/features/home/domain/entities/video_entity.dart';
import 'package:flutter_videos_app/features/home/domain/use_cases/get_related_videos_use_case.dart';

part 'video_details_state.dart';

class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  final GetRelatedVideosUseCase _getRelatedVideosUseCase;
  final String? _id;
  final String? _category;

  VideoDetailsCubit({
    required GetRelatedVideosUseCase getRelatedVideosUseCase,
    required String? id,
    required String? category,
  })  : _id = id,
        _category = category,
        _getRelatedVideosUseCase = getRelatedVideosUseCase,
        super(const VideoDetailsState()) {
    getRelatedVideos();
  }

  void _setVideos(List<VideoFileEntity>? value) {
    emit(state.copyWith(list: value));
  }

  void _setLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  void _setComments(List<String>? value) {
    emit(state.copyWith(comments: value));
  }

  void addComment(String value) {
    _setComments([...state.comments, value]);
  }

  Future<void> getRelatedVideos() async {
    final isEmpty = state.list == null;

    if (isEmpty) {
      _setLoading(true);
    }

    final offset = state.list?.length ?? 0;

    List<VideoFileEntity>? data = await _getRelatedVideosUseCase.call(
      offset: offset,
      limit: 10,
      id: _id,
      category: _category,
    );

    if (data != null) {
      data = isEmpty ? data : [...(state.list ?? []), ...data];
      _setVideos(data);
    }

    _setLoading(false);
  }
}
