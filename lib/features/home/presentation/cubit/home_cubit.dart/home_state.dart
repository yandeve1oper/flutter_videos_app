part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<VideoFileEntity>? list;
  final bool isLoading;

  const HomeState({this.list, this.isLoading = false});

  HomeState copyWith({
    List<VideoFileEntity>? list,
    bool? isLoading,
  }) {
    return HomeState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [list, isLoading];
}
