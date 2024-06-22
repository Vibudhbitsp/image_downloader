// domain/usecases/fetch_images_usecase.dart
import '../../data/repositories/image_repository.dart';
import '../entities/image_entity.dart';

class FetchImagesUseCase {
  final ImageRepository repository;

  FetchImagesUseCase({required this.repository});

  Future<List<ImageEntity>> execute() async {
    final images = await repository.fetchImages();
    return images.map((image) => ImageEntity(
      id: image.id,
      author: image.author,
      imageUrl: image.imageUrl,
      downloadUrl: image.downloadUrl,
    )).toList();
  }
}
