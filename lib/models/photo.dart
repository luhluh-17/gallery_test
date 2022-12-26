class Photo {
  late String _image;
  late bool _isDisplayedinCarousel;
  late int _tabIndex;

  Photo(this._image, this._isDisplayedinCarousel, this._tabIndex);

  set setImage(String image) {
    _image = image;
  }

  set setIsDisplayedinCarousel(bool value) {
    _isDisplayedinCarousel = value;
  }

  set setTabIndex(int tabIndex) {
    _tabIndex = tabIndex;
  }

  String get image => _image;

  bool get isDisplayedinCarousel => _isDisplayedinCarousel;

  int get tabIndex => _tabIndex;
}
