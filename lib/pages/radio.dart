
import 'package:flutter/material.dart';

class create extends StatefulWidget{
  int radio;
  @override
 State<StatefulWidget> createState()=>fulWidget();
}



class fulWidget extends State<create>
{
  @override
  Widget build(BuildContext context)
  {
    
    void radiochecked(int varr){
   setState((){
      print(varr);
     widget.radio=varr;
   });
  }
    return Scaffold(
      //backgroundColor: Colors.purple[100],

      appBar: AppBar(
        title:Text ('Register Now!',style: TextStyle(color: Colors.purple[100],fontSize: 20,),),
        backgroundColor: Colors.purple[800],
      ),
      body:new Container(

          child:Column(

            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: widget.radio,
                      onChanged:radiochecked,
                    ),
                    Text('Male')
                  ],
                ),

              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: widget.radio,
                      onChanged:radiochecked,
                    ),
                    Text('Female')
                  ],
                ),

              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: widget.radio,
                      onChanged:radiochecked,
                    ),
                    Text('animal')
                  ],
                ),

              ),
            ],
          )
      ),
    );

  }
}


