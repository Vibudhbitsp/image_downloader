// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/api/image_service.dart';
import 'data/repositories/image_repository.dart';
import 'domain/usecases/fetch_images_usecase.dart';
import 'presentation/providers/image_provider.dart'; // Now refers to `ImageNotifier`
import 'presentation/screens/image_downloader_screen.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final imageService = ImageService(dio: dio);
    final imageRepository = ImageRepository(imageService: imageService);
    final fetchImagesUseCase = FetchImagesUseCase(repository: imageRepository);

    return ChangeNotifierProvider(
      create: (context) => ImageNotifier(fetchImagesUseCase: fetchImagesUseCase)..fetchImages(),
      child: MaterialApp(
        title: 'Image Downloader',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ImageDownloaderScreen(),
      ),
    );
  }
}
