import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/product/price_tag.dart';
import 'package:my_app/widgets/ui_elements/title.dart';


import '../location.dart';


class ProductCard extends StatelessWidget{
  final Color heartIconColor = Colors.red;
  final IconData heartIcon = Icons.favorite_border;
  final Map<String,dynamic>product;
  final int productIndex;
  ProductCard(this.product,this.productIndex);
  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleDefault(product['title']),
              SizedBox(
                width: 10.0,
              ),
              PriceTag(product['price'].toString())
            ],
          ),
          LocationTextWidget(
            product['location'],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pushNamed<bool>(
                      context, '/product/' + productIndex.toString());
                },
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
              ),
              IconButton(
                onPressed: () {
                  /*setState(() {
                    if (product['favourite'] == Icons.favorite)
                      product['favourite'] =
                          Icons.favorite_border;
                    else
                      product['favourite'] = Icons.favorite;
                  });*/
                },
                icon: Icon(product['favourite']),
                color: heartIconColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}