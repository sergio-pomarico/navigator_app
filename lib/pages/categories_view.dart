import 'package:flutter/material.dart';
import 'package:navigator_application/model/category.dart';
import 'package:navigator_application/providers/categories_provider.dart';
import 'package:navigator_application/router/page_manager.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesProvider provider = context.watch<CategoriesProvider>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu a la carta'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            provider.addCategory();
          },
        ),
        body: ListView.builder(
          itemCount: provider.categories.length,
          itemBuilder: (BuildContext context, int index) {
            Category cartegory = provider.categories[index];
            return ListTile(
              onTap: () {
                RouterPageManager.of(context).openDetails(cartegory);
              },
              title: Text(cartegory.name),
            );
          },
        ));
  }
}
