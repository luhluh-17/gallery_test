class Photo {
  String _image;
  bool _isDisplayedinCarousel;
  int _tabIndex;

  Photo(this._image, this._isDisplayedinCarousel, this._tabIndex);

  get image => _image;

  set image(value) => _image = value;

  get isDisplayedinCarousel => _isDisplayedinCarousel;

  set isDisplayedinCarousel(value) => _isDisplayedinCarousel = value;

  get tabIndex => _tabIndex;

  set tabIndex(value) => _tabIndex = value;
}
