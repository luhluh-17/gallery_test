import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:sample_gallery/arguments/photo_data.dart';
import 'package:sample_gallery/models/photo.dart';
import 'package:sample_gallery/ui/screens/gallery/image_carousel.dart';

List<Photo> imageList = [
  Photo('assets/images/image_1.jpg', false, 0),
  Photo('assets/images/image_2.jpg', false, 0),
  Photo('assets/images/image_3.jpg', true, 0),
  Photo('assets/images/image_4.jpg', false, 0),
  Photo('assets/images/image_5.jpg', true, 0),
  Photo('assets/images/image_6.jpg', false, 1),
  Photo('assets/images/image_7.jpg', true, 1),
  Photo('assets/images/image_8.jpg', false, 1),
  Photo('assets/images/image_9.jpg', true, 1),
  Photo('assets/images/image_10.jpg', true, 1),
];

List<Photo> getImagesList(int index) {
  return imageList.where((item) => item.tabIndex == index).toList();
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _selectedIndex = 0;
  List<Photo> _carouselList = imageList;
  List<Photo> _imageTabList = getImagesList(0);
  int _firstTabCount = getImagesList(0).length;
  int _secondTabCount = getImagesList(1).length;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _imageTabList =
          _carouselList.where((item) => item.tabIndex == index).toList();
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
          ImageCarousel(imageList: _carouselList),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 3,
              ),
              itemCount: _imageTabList.length,
              itemBuilder: (BuildContext context, int index) {
                return FocusedMenuHolder(
                  menuWidth: MediaQuery.of(context).size.width * 0.50,
                  blurSize: 5.0,
                  menuItemExtent: 45,
                  menuBoxDecoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  duration: const Duration(milliseconds: 100),
                  animateMenuItems: true,
                  blurBackgroundColor: Colors.black54,
                  menuOffset: 10.0,
                  bottomOffsetHeight: 80.0, //
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/photo',
                      arguments: PhotoData(image: _imageTabList[index].image),
                    );
                  },
                  menuItems: [
                    FocusedMenuItem(
                      title: const Text('Move Tab'),
                      trailingIcon: const Icon(Icons.tab),
                      onPressed: () {
                        setState(() {
                          Photo result = _carouselList.firstWhere((element) =>
                              element.image == _imageTabList[index].image);
                          result.tabIndex = (result.tabIndex == 0) ? 1 : 0;
                          _carouselList[_carouselList.indexOf(result)] = result;
                          _imageTabList = _carouselList
                              .where((item) => item.tabIndex == _selectedIndex)
                              .toList();

                          _firstTabCount = _carouselList
                              .where((item) => item.tabIndex == 0)
                              .toList()
                              .length;
                          _secondTabCount = _carouselList
                              .where((item) => item.tabIndex == 1)
                              .toList()
                              .length;
                        });
                      },
                    ),
                    FocusedMenuItem(
                      title: Text(
                        _imageTabList[index].isDisplayedinCarousel == true
                            ? 'Remove Image'
                            : 'Display Image',
                      ),
                      trailingIcon: const Icon(Icons.view_carousel),
                      onPressed: () {
                        setState(() {
                          Photo result = _carouselList.firstWhere((element) =>
                              element.image == _imageTabList[index].image);
                          result.isDisplayedinCarousel =
                              !result.isDisplayedinCarousel;
                          _carouselList[_carouselList.indexOf(result)] = result;
                        });
                      },
                    ),
                  ],
                  child: Hero(
                    tag: _imageTabList[index].image,
                    child: Image.asset(
                      _imageTabList[index].image,
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.image),
            label: 'Tab A ($_firstTabCount)',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.image),
            label: 'Tab A ($_secondTabCount)',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
