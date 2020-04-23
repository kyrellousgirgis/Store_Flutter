import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/price_tag.dart';

class Products extends StatefulWidget {
  
  final List<Map<String, dynamic>> products;

  Products(
    this.products,
  );
  @override
  State<StatefulWidget> createState() {
    return _ProductsState();
  }
}

class _ProductsState extends State<Products> {
  Color heartIconColor = Colors.red;
  IconData heartIcon=Icons.favorite_border;
  Widget _buildProducyItem(BuildContext context, int index) {
    
    

    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(widget.products[index]['image']),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.products[index]['title'],
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald',
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
             PriceTag(widget.products[index]['price'].toString())   
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(4.0)),
            child: Text('${widget.products[index]['location']}'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pushNamed<bool>(
                      context, '/product/' + index.toString());
                },
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
              ),
              IconButton(
                onPressed: () {
                  
                  setState(() {
                    
                  if (widget.products[index]['favourite'] == Icons.favorite)
                    widget.products[index]['favourite'] = Icons.favorite_border;
                  else
                     widget.products[index]['favourite']= Icons.favorite;
                  });
                },
                icon: Icon(widget.products[index]['favourite']),
                color: heartIconColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productList;
    if (widget.products.length > 0) {
      productList = ListView.builder(
        itemBuilder: _buildProducyItem,
        itemCount: widget.products.length,
      );
    } else {
      productList = Center(
        child: Text('No products found, Please add some'),
      );
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
