import 'package:flutter/material.dart';
import 'package:sample_gallery/arguments/photo_data.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PhotoData;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Photo'),
      ),
      body: Hero(
        tag: args.image,
        child: Image.asset(
          args.image,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
