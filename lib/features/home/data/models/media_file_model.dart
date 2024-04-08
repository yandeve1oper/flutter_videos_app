import 'package:flutter_videos_app/common/data/mappers/entity_convertable.dart';

enum MediaFileType { image, video }

abstract class MediaFileModel with EntityConvertable {
  final String id;
  final MediaFileType type;
  final String? url;

  const MediaFileModel({required this.id, required this.type, this.url});
}
