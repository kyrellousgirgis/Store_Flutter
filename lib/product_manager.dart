import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/product/products.dart';





class ProductManager extends StatelessWidget {
 
  final List<Map<String, dynamic>> products;
  
  ProductManager(this.products); 
  @override
  Widget build(BuildContext context) {
    
    return Column(children: [


      Expanded (child:Products(products))
    ]);
  }
 
}
