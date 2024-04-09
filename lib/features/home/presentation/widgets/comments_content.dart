import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:flutter_videos_app/features/home/presentation/cubit/video_details_cubit/video_details_cubit.dart';

class CommentsContent extends StatelessWidget {
  final _controller = TextEditingController();

  CommentsContent({super.key});

  void _onTap(BuildContext context) {
    final value = _controller.text;
    _controller.clear();

    context.read<VideoDetailsCubit>().addComment(value);
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final comments = context.select((VideoDetailsCubit c) => c.state.comments);

    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: bottomPadding,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: ModalScrollController.of(context),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(comments[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Write a comment...',
                  ),
                  controller: _controller,
                ),
              ),
              IconButton(
                onPressed: () => _onTap(context),
                icon: const Icon(Icons.send),
              )
            ]),
            const SizedBox(height: 28)
          ],
        ),
      ),
    );
  }
}
