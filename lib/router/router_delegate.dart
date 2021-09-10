import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator_application/router/app_path.dart';
import 'package:navigator_application/router/page_manager.dart';
import 'package:provider/provider.dart';

class AppRouteDelegate extends RouterDelegate<AppPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPath> {
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  final RouterPageManager _pageManager = RouterPageManager();

  AppRouteDelegate() {
    _pageManager.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _pageManager,
        child: Consumer<RouterPageManager>(
          builder: (context, pageManager, child) {
            return Navigator(
              pages: List.of(_pageManager.pages),
              onPopPage: _popPage,
            );
          },
        ),
      );

  bool _popPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    _pageManager.didPop(route.settings as Page);
    return true;
  }

  @override
  AppPath get currentConfiguration => _pageManager.currentPath;

  @override
  Future<void> setNewRoutePath(AppPath configuration) async {
    await _pageManager.setNewRoutePath(configuration);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navKey;
}
