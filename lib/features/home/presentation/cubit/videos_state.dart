part of 'videos_cubit.dart';

class VideosState extends Equatable {
  final List<VideoFileEntity>? list;
  final bool isLoading;

  const VideosState({this.list, this.isLoading = false});

  VideosState copyWith({
    List<VideoFileEntity>? list,
    bool? isLoading,
  }) {
    return VideosState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [list, isLoading];
}
