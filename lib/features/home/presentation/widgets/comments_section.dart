import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_videos_app/common/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter_videos_app/features/home/presentation/cubit/video_details_cubit/video_details_cubit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'comments_content.dart';

class CommentsSection extends StatelessWidget {
  final double maxHeight;

  const CommentsSection({super.key, required this.maxHeight});

  void _onTap(BuildContext context) {
    showMaterialModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<VideoDetailsCubit>(),
        child: SizedBox(
          height: maxHeight,
          child: CommentsContent(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final photoUrl = context.read<AuthCubit>().state.user?.photoURL ?? '';
    final lastComment = context.select((VideoDetailsCubit c) {
      final comments = c.state.comments;

      if (comments.isEmpty) {
        return 'Write a comment...';
      }

      return comments.last;
    });

    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Comments'),
          const SizedBox(height: 2),
          Row(children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.network(photoUrl, height: 32),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: InkWell(
                onTap: () => _onTap(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(lastComment),
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
