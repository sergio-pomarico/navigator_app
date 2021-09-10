import 'package:flutter/material.dart';
import 'package:navigator_application/model/category.dart';
import 'package:navigator_application/pages/categories_view.dart';
import 'package:navigator_application/pages/item_view.dart';
import 'package:provider/provider.dart';

class RouterPageManager extends ChangeNotifier {
  final List<Page> _pages = <Page>[
    MaterialPage(
      child: CategoriesPage(),
      key: ValueKey('/list'),
      name: 'list',
    ),
  ];

  List<Page> get pages => List.unmodifiable(_pages);

  void openDetails(Category category) {
    _pages.add(
      MaterialPage(
        child: ItemPage(category),
      ),
    );
    notifyListeners();
  }

  void didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  static RouterPageManager of(BuildContext context) =>
      Provider.of<RouterPageManager>(context, listen: false);
}
