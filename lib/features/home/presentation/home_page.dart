import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_videos_app/core/services/injector.dart';
import 'package:flutter_videos_app/features/home/presentation/cubit/videos_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideosCubit(getVideosUseCase: injector())..getVideos(),
      child: BlocBuilder<VideosCubit, VideosState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const CircularProgressIndicator.adaptive();
          }

          return SafeArea(
            child: Scaffold(
              body: ListView.builder(
                itemCount: state.list?.length,
                itemBuilder: (context, index) {
                  final c = context.read<VideosCubit>().state.list;
                  return Image.asset(c?[index].previewUrl ?? '');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
