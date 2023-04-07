/// return a string concating file and extension
String? thumbnailJsonToString(Map<String, dynamic>? json) {
  final thumbnailData = json;

  String? thumbnail;

  if (thumbnailData != null) {
    thumbnail = '${thumbnailData["path"]}.${thumbnailData["extension"]}';
  }

  return thumbnail;
}
