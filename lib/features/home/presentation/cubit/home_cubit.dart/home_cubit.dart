import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_videos_app/features/home/domain/entities/video_entity.dart';
import 'package:flutter_videos_app/features/home/domain/use_cases/get_videos_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetVideosUseCase _getVideosUseCase;

  HomeCubit({
    required GetVideosUseCase getVideosUseCase,
  })  : _getVideosUseCase = getVideosUseCase,
        super(const HomeState());

  void _setVideos(List<VideoFileEntity>? value) {
    emit(state.copyWith(list: value));
  }

  void _setLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  Future<void> getVideos({bool refresh = false}) async {
    final offset = refresh ? 0 : state.list?.length ?? 0;
    final isEmpty = offset == 0;

    if (!refresh && isEmpty) {
      _setLoading(true);
    }

    final fromCache = state.list == null;

    await _getVideosUseCase
        .call(limit: 10, offset: offset, fromCache: fromCache)
        .forEach((data) {
      if (data == null) return;

      data = isEmpty ? data : [...(state.list ?? []), ...data];

      _setVideos(data);
    });

    _setLoading(false);
  }
}
