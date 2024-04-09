part of 'video_details_cubit.dart';

class VideoDetailsState extends Equatable {
  final List<VideoFileEntity>? list;
  final bool isLoading;
  final List<String> comments;

  const VideoDetailsState({
    this.list,
    this.isLoading = false,
    this.comments = const [],
  });

  VideoDetailsState copyWith({
    List<VideoFileEntity>? list,
    bool? isLoading,
    List<String>? comments,
  }) {
    return VideoDetailsState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object?> get props => [list, isLoading, comments];
}
