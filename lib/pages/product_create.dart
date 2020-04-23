import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function add;
  ProductCreate(this.add);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreate> {
  String _titleValue;
  String _descriptionValue;
  double _priceVAlue;

  String _location;
@override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration:
                InputDecoration(labelText: 'Title', icon: Icon(Icons.title)),
            autocorrect: true,
            cursorRadius: Radius.circular(5),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                labelText: 'Discription',
                hintText: 'Enter discription',
                icon: Icon(Icons.add_comment)),
            keyboardType: TextInputType.emailAddress,
            maxLines: 4,
            autocorrect: true,
            cursorColor: Theme.of(context).primaryColorLight,
            cursorRadius: Radius.circular(5),
            onChanged: (String value) {
              setState(() {
                _descriptionValue = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextField(
            decoration:
                InputDecoration(labelText: 'Price', icon: Icon(Icons.payment)),
            keyboardType: TextInputType.number,
            autocorrect: true,
            cursorRadius: Radius.circular(5),
            onChanged: (String value) {
              setState(() {
                _priceVAlue = double.parse(value);
              });
            },
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                labelText: 'Location',
                icon: Icon(Icons.location_on),
                border: OutlineInputBorder()),
            keyboardType: TextInputType.text,
            autocorrect: true,
            cursorRadius: Radius.circular(5),
            onChanged: (String value) {
              setState(() {
                _location = value;
              });
            },
          ),
          
        
          SizedBox(height: 10),
          RaisedButton(
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'image': 'assets/food.jpg',
                'price': _priceVAlue,
                'description': _descriptionValue,
                'favourite': Icons.favorite_border,
                'location':_location,
              };
              widget.add(product);
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: Text('Save'),
            //textColor: Theme.of(context).primaryColorLight,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
