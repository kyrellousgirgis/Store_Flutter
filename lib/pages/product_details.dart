import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/product/price_tag.dart';
import 'package:my_app/widgets/ui_elements/title.dart';

class ProductPage extends StatelessWidget {
  final String imageURL;
  final String title;
  final double price;
  final String location;
  final String description;
  ProductPage(
      this.imageURL, this.title, this.location, this.price, this.description);
  _showWarningDialog(BuildContext context) {
    showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              print('You tapped any where');
              Navigator.pop(context, false);
              return Future.value(false);
            },
            child: AlertDialog(
              title: Text('Are you sure?'),
              content: Text('This cannot be undone'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('Delete'),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('Discard'),
                )
              ],
            ),
          );
        }).then((bool onValue) {
      if (onValue) Navigator.pop(context, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('System back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('ProductDetails'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageURL),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(title,)
            ),
            //Container(
            //padding: EdgeInsets.all(10.0),
            //child: RaisedButton(
            //child: Text('Delete'),
            //onPressed: () => _showWarningDialog(context),

            // Navigator.pop(context, true);},
            //color: Theme.of(context).accentColor,), ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Text(
                    location,
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                  ),
                  Container(
                    child: Text(
                      '|',
                      style: TextStyle(color: Colors.grey),
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),
                  
                  PriceTag(price.toString()),
                  SizedBox(width: 10.0)
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            SizedBox(height: 10.0),
            Text(description)
          ],
        ),
      ),
    );
  }
}
