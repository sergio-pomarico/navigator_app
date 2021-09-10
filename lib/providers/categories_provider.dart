import 'package:flutter/material.dart';
import 'package:navigator_application/model/category.dart';
import 'package:navigator_application/model/item.dart';

List<Category> menu = <Category>[
  Category(
    name: 'Comida Rápida',
    id: '1',
    menu: <Item>[
      Item('Perro Caliente', '10000'),
      Item('Hamburgesa', '15000'),
      Item('Piazza', '12000'),
    ],
  ),
  Category(
    id: '2',
    name: 'Comida Italiana',
    menu: <Item>[
      Item('Rissotto', '20000'),
      Item('Lasaña', '25000'),
      Item('Pastas', '12000'),
    ],
  ),
  Category(
    name: 'Comida de Mar',
    id: '3',
    menu: <Item>[
      Item('Camarones', '20000'),
      Item('Langosta', '55000'),
      Item('Salmon', '12000'),
    ],
  ),
];

class CategoriesProvider extends ChangeNotifier {
  List<Category> categories = [];

  CategoriesProvider() {
    addData();
  }

  void addData() {
    categories = menu;
  }

  void addCategory() {
    categories.add(
      Category(
        id: '4',
        name: 'Comida del Pasifico',
        menu: [],
      ),
    );
    notifyListeners();
  }
}
