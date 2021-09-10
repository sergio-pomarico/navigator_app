import 'package:flutter/material.dart';
import 'package:navigator_application/providers/categories_provider.dart';
import 'package:navigator_application/router/router_delegate.dart';
import 'package:navigator_application/router/router_information_parser.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => CategoriesProvider(),
      child: MaterialApp.router(
        title: 'Navigator 2.0',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        routeInformationParser: AppRouteInformationParser(),
        routerDelegate: AppRouteDelegate(),
      ),
    );
  }
}
