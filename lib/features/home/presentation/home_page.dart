import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_videos_app/core/router/pages.dart';

import 'package:flutter_videos_app/core/services/injector.dart';
import 'package:flutter_videos_app/features/home/presentation/cubit/videos_cubit.dart';

import 'widgets/video_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideosCubit(getVideosUseCase: injector())..getVideos(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text(HomePages.root.title)),
          body: VideosListView(),
        ),
      ),
    );
  }
}
