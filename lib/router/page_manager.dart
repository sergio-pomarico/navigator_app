import 'package:flutter/material.dart';
import 'package:navigator_application/model/category.dart';
import 'package:navigator_application/pages/categories_view.dart';
import 'package:navigator_application/pages/item_view.dart';
import 'package:navigator_application/router/app_path.dart';
import 'package:provider/provider.dart';

class RouterPageManager extends ChangeNotifier {
  final List<Page> _pages = <Page>[
    MaterialPage(
      key: UniqueKey(),
      child: CategoriesPage(),
      name: '/',
    ),
  ];

  List<Page> get pages => List.unmodifiable(_pages);

  void openDetails(Category category) {
    _pages.add(
      MaterialPage(
        key: UniqueKey(),
        name: '/category/${category.id}',
        child: ItemPage(category),
      ),
    );
    notifyListeners();
  }

  void didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  AppPath get currentPath => AppPath.parse(_pages.last.name ?? '');

  static RouterPageManager of(BuildContext context) =>
      Provider.of<RouterPageManager>(context, listen: false);

  Future<void> setNewRoutePath(AppPath configuration) async {
    if (configuration.isUnknownPage) {
      _pages.removeLast();
    } else if (configuration.isHomePage) {
      _pages.removeWhere((page) => page.name != '/');
    }
    notifyListeners();
  }
}
