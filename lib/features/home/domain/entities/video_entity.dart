import 'package:equatable/equatable.dart';

import 'package:flutter_videos_app/features/home/data/models/media_file_model.dart';

class VideoFileEntity extends Equatable {
  final String? id;
  final MediaFileType? type;
  final String? url;
  final String? title;
  final String? description;
  final String? category;
  final List<String>? tags;
  final String? previewUrl;

  const VideoFileEntity({
    required this.id,
    required this.type,
    this.url,
    this.title,
    this.description,
    this.category,
    this.tags,
    this.previewUrl,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        url,
        title,
        description,
        category,
        tags,
        previewUrl,
      ];
}
