import 'package:flutter/material.dart';
import 'package:navigator_application/model/category.dart';
import 'package:navigator_application/model/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage(this.item, {Key? key}) : super(key: key);
  final Category item;
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: this.item.menu.length,
          itemBuilder: (BuildContext context, int index) {
            List<Item> menu = this.item.menu;
            return ListTile(
              title: Text(menu[index].name),
            );
          },
        ),
      ));
}
