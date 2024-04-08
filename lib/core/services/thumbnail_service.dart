import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ThumbnailService {
  Future<String?> generateThumbnailFromAsset(String path) async {
    final byteData = await rootBundle.load(path);
    final tempDir = await getTemporaryDirectory();

    final tempVideo = File('${tempDir.path}/$path')
      ..createSync(recursive: true)
      ..writeAsBytesSync(
        byteData.buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        ),
      );

    final fileName = await VideoThumbnail.thumbnailFile(
      video: tempVideo.path,
      thumbnailPath: tempDir.path,
      imageFormat: ImageFormat.JPEG,
      quality: 20,
    );

    return fileName;
  }
}
