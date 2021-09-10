import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  String currentItem = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator 2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // nos obliga a no apilar vistas
      // manejar programaticamente el stack
      home: Navigator(
        pages: [
          MaterialPage(
              child: ListPage(
                onItemSelect: _onItemTap,
              ),
              key: ValueKey('/list'),
              name: 'list'),
          if (currentItem.isNotEmpty)
            MaterialPage(
              child: ItemPage(currentItem),
              name: '/item',
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          setState(() {
            currentItem = '';
          });
          return true;
        },
      ),
    );
  }

  _onItemTap(String item) {
    setState(() {
      currentItem = item;
    });
  }
}

class ListPage extends StatelessWidget {
  const ListPage({
    required this.onItemSelect,
    Key? key,
  }) : super(key: key);

  final Function(String) onItemSelect;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Navigator 2.0'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              onItemSelect('Item $index');
            },
            title: Text('Item $index'),
          );
        },
      ));
}

class ItemPage extends StatelessWidget {
  const ItemPage(this.item, {Key? key}) : super(key: key);
  final String item;
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(this.item),
      ),
      body: Center(
        child: Text(item),
      ));
}
