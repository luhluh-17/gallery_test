import 'package:flutter/material.dart';
import 'package:sample_gallery/arguments/photo_data.dart';
import 'package:sample_gallery/models/photo.dart';
import 'package:sample_gallery/ui/screens/gallery/image_carousel.dart';

List<Photo> imageList = [
  Photo('assets/images/image_1.jpg', true, 0),
  Photo('assets/images/image_2.jpg', false, 0),
  Photo('assets/images/image_3.jpg', true, 0),
  Photo('assets/images/image_4.jpg', false, 0),
  Photo('assets/images/image_5.jpg', true, 0),
  Photo('assets/images/image_6.jpg', false, 1),
  Photo('assets/images/image_7.jpg', false, 1),
  Photo('assets/images/image_8.jpg', false, 1),
  Photo('assets/images/image_9.jpg', true, 1),
  Photo('assets/images/image_10.jpg', true, 1),
];

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _selectedIndex = 0;
  List<Photo> _imageList =
      imageList.where((item) => item.tabIndex == 0).toList();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _imageList = imageList.where((item) => item.tabIndex == index).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gallery'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const ImageCarousel(),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 3,
              ),
              itemCount: _imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/photo',
                      arguments: PhotoData(image: _imageList[index].image),
                    );
                  },
                  child: Hero(
                    tag: _imageList[index].image,
                    child: Image.asset(
                      _imageList[index].image,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Tab A',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Tab B',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
