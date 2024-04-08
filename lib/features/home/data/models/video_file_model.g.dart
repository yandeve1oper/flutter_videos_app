// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoFileModel _$VideoFileModelFromJson(Map<String, dynamic> json) =>
    VideoFileModel(
      id: json['id'] as String,
      type: $enumDecode(_$MediaFileTypeEnumMap, json['type']),
      url: json['url'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VideoFileModelToJson(VideoFileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MediaFileTypeEnumMap[instance.type]!,
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'tags': instance.tags,
    };

const _$MediaFileTypeEnumMap = {
  MediaFileType.image: 'image',
  MediaFileType.video: 'video',
};
