// data/repositories/image_repository.dart
import '../api/image_service.dart';
import '../models/image_info.dart';

class ImageRepository {
  final ImageService imageService;

  ImageRepository({required this.imageService});

  Future<List<ImageInfo>> fetchImages() async {
    final data = await imageService.fetchImages();
    return data.map((json) => ImageInfo.fromJson(json)).toList();
  }
}
