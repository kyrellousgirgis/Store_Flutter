import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../product_manager.dart';

class HomePage extends StatelessWidget {
  final List<Map<String,dynamic>>products;
  
  HomePage(this.products);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage('assets/female.png'),),
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
      title: Text('eASYlIST'),
      actions: <Widget>[IconButton(icon: Icon(Icons.favorite,color: Colors.white,), onPressed: null)],
      ),
      body: ProductManager(products),
    );
  }
}
