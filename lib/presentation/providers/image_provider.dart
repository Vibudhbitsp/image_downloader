// lib/presentation/providers/image_provider.dart
import 'package:flutter/material.dart';
import '../../domain/entities/image_entity.dart';
import '../../domain/usecases/fetch_images_usecase.dart';

class ImageNotifier with ChangeNotifier {
  final FetchImagesUseCase fetchImagesUseCase;

  ImageNotifier({required this.fetchImagesUseCase});

  List<ImageEntity> _images = [];
  bool _isLoading = false;

  List<ImageEntity> get images => _images;
  bool get isLoading => _isLoading;

  Future<void> fetchImages() async {
    _isLoading = true;
    notifyListeners();

    try {
      print('Fetching images...');
      _images = await fetchImagesUseCase.execute();
      print('Fetched images: ${_images.length}'); // Log the number of images fetched
      for (var image in _images) {
        print('Image ID: ${image.id}, Author: ${image.author}');
      }
    } catch (e) {
      print('Error fetching images: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
