import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:combustivel_ideal/page/historico_page.dart';


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
  
Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );

  Widget buildAppBar(){
    return AppBar(
    title: Text ("Combustível Ideal", style: TextStyle(color: Colors.white, fontSize: 25),),
    
    
    centerTitle: true,
    backgroundColor: Colors.blue,
    
    actions: <Widget>[
      //Icon(Icons.history),
      RaisedButton(
        child: Icon(
          Icons.history,
          color: Colors.white,
          size: 40,
          
        ),
        color: Colors.blue,
        
        
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Historico()
          ));
        },
      ) 
      
          
    ]
    );
  }

  Widget buildScaffold(){
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Nome do Posto", labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Preço do Etanol", labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              keyboardType: TextInputType.number,

            ),
            TextField(
              decoration: InputDecoration(labelText: "Preço da Gasolina", labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Data Atual", labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              style: TextStyle(color: Colors.blue),
              keyboardType: TextInputType.datetime,
            ),
              
                
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,

                  children: <Widget>[
                    RaisedButton(                      
                      child: Text("Comparar", style: TextStyle(color: Colors.white, fontSize: 30),),
                      color: Colors.blue,
                      elevation: 4.0,
                      splashColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed:(){
                        showDialog(
                          context: context,
                          builder: (ctxt) => new AlertDialog(
                          title: Text("Resultado"),
                          content: Text("Para o abastecimento o XX é mais vantajoso!"),
                          actions: <Widget>[
                            okButton
                          ],
                          ),
                          
                          
                        );
                      }
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