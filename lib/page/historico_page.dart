import 'package:combustivel_ideal/helpers/comparacao_helper.dart';

import 'package:combustivel_ideal/model/comparacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';




class Historico extends StatefulWidget {

  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {

  ComparacaoHelper helper = ComparacaoHelper();
  List<Comparacao> lsComparacao = List();

  @override
  void initState() { 
    super.initState();


    helper.selectAll().then((list){
      setState((){
        lsComparacao = list;
      });
    });    
  }

    Widget buildCardComparacao(BuildContext context, int index){
      return GestureDetector(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //Text(lsComparacao[index].id ?? "--",
                              //style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            //),

                            Text(lsComparacao[index].posto ?? "--",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),

                            Text(lsComparacao[index].precoEtanol ?? "--",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),

                            Text(lsComparacao[index].precoGasolina ?? "--",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),


                            Text(lsComparacao[index].dataAtual ?? "--",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

  Widget buildListView(){
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: lsComparacao.length,
      itemBuilder: (context, index){
        return buildCardComparacao(context, index);
      });
  }

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
      body: buildListView(),
    );

  }


  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

}