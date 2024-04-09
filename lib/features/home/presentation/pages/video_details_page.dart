import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_videos_app/core/router/pages.dart';
import 'package:flutter_videos_app/core/services/injector.dart';

import 'package:flutter_videos_app/features/home/domain/entities/video_entity.dart';
import 'package:flutter_videos_app/features/home/presentation/cubit/video_details_cubit/video_details_cubit.dart';
import 'package:flutter_videos_app/features/home/presentation/widgets/video_list_view.dart';

import '../widgets/comments_section.dart';
import '../widgets/video_widget.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({super.key, this.file});

  final VideoFileEntity? file;

  String get _tags {
    if (file?.tags?.isNotEmpty ?? false) {
      return '#${file!.tags!.join(', #')}';
    }

    return '';
  }

  (bool, List<VideoFileEntity>) _selectTriggers(VideoDetailsCubit cubit) {
    final state = cubit.state;

    return (state.isLoading, state.list ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoDetailsCubit(
        getRelatedVideosUseCase: injector(),
        id: file?.id,
        category: file?.category,
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(HomePages.videoDetails.title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoWidget(path: file?.url),
            const Divider(height: 4),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                final maxHeight = constraints.maxHeight;

                return VideosListView<VideoDetailsCubit>(
                  onLoadingMore:
                      context.read<VideoDetailsCubit>().getRelatedVideos,
                  selectTriggers: _selectTriggers,
                  topWidgets: [
                    const SizedBox(height: 4),
                    Text(
                      file?.title ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      file?.description ?? '',
                      style: const TextStyle(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(_tags),
                    const SizedBox(height: 8),
                    CommentsSection(maxHeight: maxHeight),
                    const SizedBox(height: 22),
                    const Text(
                      'Related videos:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
