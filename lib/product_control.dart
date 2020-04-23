import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget{
  final Function add;
  ProductControl(this.add);
  @override
  Widget build(BuildContext context) {
    
    return  RaisedButton(
            color: Theme.of(context).accentColor,
              onPressed: () {
                add({'title':'Chocolate','image':'assets/food.jpg'});
              },
              child: Text('Add'));
  }
}