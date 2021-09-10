class AppPath {
  AppPath.home()
      : _categoryId = null,
        _isUnknown = false;

  AppPath.unknown()
      : _categoryId = null,
        _isUnknown = true;

  AppPath.category(String id)
      : _categoryId = id,
        _isUnknown = false;

  final String? _categoryId;
  final bool _isUnknown;

  bool get isHomePage => _categoryId == null;
  bool get isCategoryPage => _categoryId != null;
  bool get isUnknownPage => _isUnknown;
  String? get categoryId => _categoryId;

  static AppPath parse(String url) {
    Uri uri = Uri.parse(url);
    if (uri.pathSegments.isEmpty) {
      return AppPath.home();
    }
    if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'category') {
      String id = uri.pathSegments.last;
      return AppPath.category(id);
    }
    return AppPath.unknown();
  }
}
