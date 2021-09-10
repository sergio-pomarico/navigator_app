class AppPath {
  AppPath.home()
      : _isHome = true,
        _isUnknown = false;

  AppPath.unknown()
      : _isHome = false,
        _isUnknown = true;

  final bool _isHome;
  final bool _isUnknown;

  bool get isHomePage => _isHome;
  bool get isUnknownPage => _isUnknown;
}
