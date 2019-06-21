import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


//List _todasComparacoes;
void main() async {

  //var db = new BDadosAjudante();

  //_todasComparacoes = await db.pegarPostos();
  //for(int i = 0; i < _todasComparacoes.length; i++){
    //Comparacao comparacao = Comparacao.map(_todasComparacoes [i]);
    //debugPrint("Usuário: ${comparacao.posto}, Id: ${comparacao.id}");
  //}



}
class Home extends StatefulWidget {
  @override

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  


  Widget buildAppBar(){
    return AppBar(
    title: Text ("Combustivel Ideal"),
    centerTitle: true,
    backgroundColor: Colors.orange,
    actions: <Widget>[
      Icon(Icons.history),
          
    ]
    );
  }

  Widget buildScaffold(){
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Nome do Posto",),
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Preço do Etanol",),
              keyboardType: TextInputType.number,

            ),
            TextField(
              decoration: InputDecoration(labelText: "Preço da Gasolina",),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Data Atual",),
              keyboardType: TextInputType.datetime,
            ),
              
                
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,

                  children: <Widget>[
                    RaisedButton(
                    child: Text("Comparar",style: TextStyle(fontSize: 40),),
                      onPressed: null,
                    ),
                  ],
                ),
          ],
            ),
          ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }
}