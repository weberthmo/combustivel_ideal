import 'package:flutter/material.dart';

 
void main() => runApp(MaterialApp(
  home: Home(),
));
 


class Home extends StatefulWidget {
  @override

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    

    AppBar appBar = AppBar(
      title: Text("Combustivel Ideal") ,
      centerTitle: true,
      backgroundColor: Colors.orange,
      actions: <Widget>[
        Icon(Icons.history),
        
      ],


    );

    

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      
    );
    return scaffold;
  }
}