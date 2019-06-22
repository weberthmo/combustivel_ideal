import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class Historico extends StatefulWidget {

  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {

  Widget buildAppBar(){
    return AppBar();
  }

  Widget buildScaffold(){
    return Scaffold(
      appBar: AppBar(
        title: Text("Históricos", style: TextStyle(color: Colors.white, fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

}