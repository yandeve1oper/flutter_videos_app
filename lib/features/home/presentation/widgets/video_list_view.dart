import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_videos_app/features/home/domain/entities/video_entity.dart';

import 'video_card.dart';
import 'video_placeholders.dart';

class VideosListView<CubitType> extends StatelessWidget {
  final _refreshController = RefreshController();
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoadingMore;
  final ScrollPhysics? physics;
  final (bool, List<VideoFileEntity>) Function(CubitType c) selectTriggers;
  final List<Widget>? topWidgets;

  bool get _hasTopWidgets => topWidgets != null;

  VideosListView({
    super.key,
    required this.selectTriggers,
    this.physics,
    this.onRefresh,
    this.onLoadingMore,
    this.topWidgets,
  });

  void _onRefresh() async {
    await onRefresh?.call();

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await onLoadingMore?.call();

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final (isLoading, list) = context.select(selectTriggers);

    Widget child;

    if (isLoading) {
      child = ListView(physics: physics, shrinkWrap: true, children: const [
        SizedBox(height: 24),
        VideoCardPlaceholer(),
        VideoCardPlaceholer(),
      ]);
    } else if (list.isEmpty) {
      child = const Center(child: Text('No data'));
    } else {
      final physics =
          _hasTopWidgets ? const NeverScrollableScrollPhysics() : null;

      child = ListView.separated(
        physics: physics,
        shrinkWrap: true,
        itemCount: list.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, index) => VideoCard(file: list[index]),
      );
    }

    if (topWidgets != null) {
      child = ListView(children: [
        ...topWidgets!,
        child,
      ]);
    }

    return SmartRefresher(
      enablePullUp: !isLoading && onLoadingMore != null,
      enablePullDown: onRefresh != null,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
      ),
      controller: _refreshController,
      child: child,
    );
  }
}
