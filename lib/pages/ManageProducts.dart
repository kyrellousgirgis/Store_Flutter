import 'package:flutter/material.dart';
import 'package:my_app/pages/product_create.dart';
import 'package:my_app/pages/product_edit.dart';

class ManageProducts extends StatelessWidget {
  final Function delete;
  final Function add;
  ManageProducts(this.delete, this.add);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Manage Products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'Edit Product',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreate(add),
            ProductEdit(),
          ],
        ),
      ),
    );
  }
}
