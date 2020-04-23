import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/ManageProducts.dart';
import 'package:my_app/pages/auth.dart';

import 'package:my_app/pages/home.dart';

import 'package:my_app/pages/product_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
      print(_products);
    });
  }

  void _delete(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }
@override

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.deepOrange,
          brightness: Brightness.dark),
      home: Auth(),
      routes: {
        '/admin': (BuildContext context) =>
            ManageProducts(_delete, _addProduct),
        '/home': (BuildContext context) => HomePage(_products),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
              _products[index]['image'],
              _products[index]['title'],
              _products[index]['location'],
              _products[index]['price'],
              _products[index]['description'],
            ),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => HomePage(
                  _products,
                ));
      },
    );
  }
}
