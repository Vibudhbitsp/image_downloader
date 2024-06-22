// data/models/image_info.dart
class ImageInfo {
  final String id;
  final String author;
  final String imageUrl;
  final String downloadUrl;

  ImageInfo({required this.id, required this.author, required this.imageUrl, required this.downloadUrl});

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      id: json['id'],
      author: json['author'],
      imageUrl: json['download_url'],
      downloadUrl: json['download_url'],
    );
  }
}
