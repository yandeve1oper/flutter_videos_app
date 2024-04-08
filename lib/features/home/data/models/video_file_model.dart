import 'package:flutter_videos_app/features/home/domain/entities/video_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'media_file_model.dart';

part 'video_file_model.g.dart';

@JsonSerializable()
class VideoFileModel extends MediaFileModel {
  final String? title;
  final String? description;
  final String? category;
  final List<String>? tags;
  final String? previewUrl;

  VideoFileModel({
    required super.id,
    required super.type,
    super.url,
    this.title,
    this.description,
    this.category,
    this.tags,
    this.previewUrl,
  });

  factory VideoFileModel.fromJson(json) => _$VideoFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoFileModelToJson(this);

  static List<VideoFileModel> fromJsonList(List? json) {
    return json?.map(VideoFileModel.fromJson).toList() ?? [];
  }

  VideoFileModel copyWithPreview(String? previewUrl) {
    return VideoFileModel(
      previewUrl: previewUrl ?? this.previewUrl,
      id: id,
      type: type,
      url: url,
      title: title,
      description: description,
      tags: tags,
      category: category,
    );
  }

  @override
  VideoFileEntity toEntity() {
    return VideoFileEntity(
      id: id,
      type: type,
      url: url,
      title: title,
      description: description,
      tags: tags,
      category: category,
      previewUrl: previewUrl,
    );
  }
}
