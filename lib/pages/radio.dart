
import 'package:flutter/material.dart';

class Create extends StatefulWidget{
  
  @override
 State<StatefulWidget> createState()=>FulWidget();
}



class FulWidget extends State<Create>
{
  int radio=0;
  @override
  Widget build(BuildContext context)
  {
    
    void radiochecked(int varr){
   setState((){
      print(varr);
     radio=varr;
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
                      groupValue: radio,
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
                      groupValue: radio,
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
                      groupValue: radio,
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


