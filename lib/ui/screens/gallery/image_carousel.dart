import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sample_gallery/models/photo.dart';
import 'package:sample_gallery/ui/screens/gallery/gallery_screen.dart';

class ImageCarousel extends StatefulWidget {
  final List<Photo> imageList;

  const ImageCarousel({super.key, required this.imageList});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlayInterval: const Duration(seconds: 5),
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageList
            .where((element) => element.isDisplayedinCarousel == true)
            .toList()
            .map((item) => Center(
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
