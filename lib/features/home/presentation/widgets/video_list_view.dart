import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_videos_app/features/home/presentation/cubit/videos_cubit.dart';

import 'video_card.dart';
import 'video_placeholders.dart';

class VideosListView extends StatelessWidget {
  final _refreshController = RefreshController();

  VideosListView({super.key});

  void _onRefresh(VideosCubit cubit) async {
    await cubit.getVideos(refresh: true);

    _refreshController.refreshCompleted();
  }

  void _onLoading(VideosCubit cubit) async {
    await cubit.getVideos();

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final (isLoading, list) = context.select((VideosCubit c) {
      final state = c.state;

      return (state.isLoading, state.list ?? []);
    });

    final Widget child;

    if (isLoading) {
      child = ListView(children: const [
        SizedBox(height: 24),
        VideoCardPlaceholer(),
        VideoCardPlaceholer(),
      ]);
    } else {
      child = ListView.separated(
        itemCount: list.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, index) => VideoCard(file: list[index]),
      );
    }

    final cubit = context.read<VideosCubit>();

    return SmartRefresher(
      enablePullUp: !isLoading,
      onRefresh: () => _onRefresh(cubit),
      onLoading: () => _onLoading(cubit),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
      ),
      controller: _refreshController,
      child: child,
    );
  }
}
