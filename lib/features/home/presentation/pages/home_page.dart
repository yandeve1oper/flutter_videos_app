import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_videos_app/core/router/pages.dart';

import 'package:flutter_videos_app/core/services/injector.dart';
import 'package:flutter_videos_app/features/home/domain/entities/video_entity.dart';

import '../cubit/home_cubit.dart/home_cubit.dart';
import '../widgets/video_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  (bool, List<VideoFileEntity>) _selectTriggers(HomeCubit cubit) {
    final state = cubit.state;

    return (state.isLoading, state.list ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(getVideosUseCase: injector())..getVideos(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text(HomePages.root.title)),
          body: Builder(builder: (context) {
            final cubit = context.read<HomeCubit>();

            return VideosListView<HomeCubit>(
              onRefresh: () => cubit.getVideos(refresh: true),
              onLoadingMore: cubit.getVideos,
              selectTriggers: _selectTriggers,
            );
          }),
        ),
      ),
    );
  }
}
