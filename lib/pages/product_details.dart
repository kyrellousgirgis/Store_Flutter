import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                ),
              ),
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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                    child: Text(
                      price.toString(),
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Oswald'),
                    ),
                  ),
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
