import 'package:flutter/material.dart';
import 'package:sample_gallery/ui/screens/gallery/image_carousel.dart';

final List<String> imgList = [
  'assets/images/image_1.jpg',
  'assets/images/image_2.jpg',
  'assets/images/image_3.jpg',
  'assets/images/image_4.jpg',
  'assets/images/image_5.jpg',
];

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 3,
              ),
              children: imgList
                  .map((item) => Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      ))
                  .toList(),
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
