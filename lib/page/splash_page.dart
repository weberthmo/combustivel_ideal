import 'dart:async';
import 'package:combustivel_ideal/page/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  


));

class SplashScreen extends StatefulWidget {
  @override

  State<StatefulWidget> createState() { return SplashScreenState();
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
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
}


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/imagens/logo_combustivel.png'),
            fit: BoxFit.cover
        ) ,
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }
}