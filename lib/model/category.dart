import './item.dart';

class Category {
  final String id;
  final String name;
  final List<Item> menu;

  Category({required this.name, required this.menu, required this.id});
}
