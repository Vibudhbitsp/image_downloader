// lib/presentation/screens/image_downloader_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/image_provider.dart'; // This refers to `ImageNotifier`

class ImageDownloaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Downloader'),
      ),
      body: Consumer<ImageNotifier>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.images.isEmpty) {
            return Center(child: Text('No images found.'));
          }

          return ListView.builder(
            itemCount: provider.images.length,
            itemBuilder: (context, index) {
              final image = provider.images[index];
              return ListTile(
                title: Text('Image ID: ${image.id}'),
                subtitle: Text('Author: ${image.author}'),
                leading: Image.network(
                  image.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  // Implement the download functionality
                },
              );
            },
          );
        },
      ),
    );
  }
}
