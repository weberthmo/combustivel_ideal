import 'package:combustivel_ideal/page/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';


void main() {
  var materialApp = MaterialApp(

    //desabilitando banner debug
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),

  );
  runApp(materialApp);
}
class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
  
}



class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }



  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text ("Etanol VS Gasolina", style: TextStyle(color: Colors.white, fontSize: 25),),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );

    Scaffold scaffold = Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getImage("logo_combustivel.png"),              
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BottomAppBar(
        //child: Text("Teste" , textAlign: TextAlign.center,),
        child: Text("version: 1.0.0+1" , textAlign: TextAlign.center,),
        color: Colors.blue,
        
      ),
    );

    return scaffold;

    
  }
  
  Widget getImage (String path) {
    return Image.asset("images/$path");
  }
}

