import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/product/products.dart';





class HomePage extends StatelessWidget {
  final List<Map<String,dynamic>>products;
  Widget _buildSideDrawer(BuildContext context)
  {
    return Drawer(
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
      );
  }
  HomePage(this.products);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:_buildSideDrawer(context), 
      appBar: AppBar(
      title: Text('eASYlIST'),
      actions: <Widget>[IconButton(icon: Icon(Icons.favorite,color: Colors.white,), onPressed: null)],
      ),
      body: Products(products),
    );
  }
}
