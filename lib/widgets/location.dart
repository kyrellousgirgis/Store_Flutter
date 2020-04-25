
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationTextWidget extends StatelessWidget{
  final String location;
  LocationTextWidget(this.location);

  @override
  Widget build(BuildContext context) {
    
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(4.0)),
            child: Text('$location'),
          );
  }
}