import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

class _AuthState extends State<Auth> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;
  DecorationImage _buildDecorationImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white12,
          labelText: 'E-mail',
          labelStyle: TextStyle(color: Colors.amberAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          hintText: 'e-mail',
          icon: Icon(Icons.email)),
      //cursorRadius: Radius.circular(60.0),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Eassword',
        labelStyle: TextStyle(color: Colors.amberAccent),
        //hintStyle: TextStyle(color: Colors.blueGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        icon: Icon(Icons.vpn_key),
        hintText: 'password',
      ),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;
        });
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
        title: Text('title'),
        secondary: Icon(Icons.warning),
        // secondary: Row(
        // children: <Widget>[
        // Text('Male'),
        //SizedBox(width: 10.0,),
        //Image.asset('assets/female.png')
        //],
        //),
        subtitle: Text('Hey You!\nHow You Doin?!'),
        isThreeLine: true,
        activeTrackColor: Colors.yellow,
        activeThumbImage: AssetImage('assets/food.jpg'),
        inactiveTrackColor: Colors.white38,
        inactiveThumbImage: AssetImage('assets/background.jpg'),
        inactiveThumbColor: Colors.black38,
        activeColor: Colors.cyan,
        value: _acceptTerms,
        onChanged: (bool value) => setState(() => _acceptTerms = value));
  }

  void _submitForm() {
    print(_emailValue);
    print(_passwordValue);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth>750.0?700.0:deviceWidth*.95; 
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: _buildDecorationImage(),
          ),
          //padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
          child: Center(
            child: SingleChildScrollView(
              //padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                width: targetWidth,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(height: 10.0),
                    _buildPasswordTextField(),
                    SizedBox(height: 10.0),
                    _buildAcceptSwitch(),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      onPressed: _submitForm,
                      color: Theme.of(context).accentColor,
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
