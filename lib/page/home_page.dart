import 'package:combustivel_ideal/helpers/comparacao_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:combustivel_ideal/page/historico_page.dart';
import 'package:combustivel_ideal/model/comparacao.dart';
import 'package:sqflite/sqflite.dart';


class Home extends StatefulWidget {
    
  
  final Comparacao comparacao;

  Home({this.comparacao});

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ComparacaoHelper helper = ComparacaoHelper();
  
  final _postoController = TextEditingController();
  final _etanolController = TextEditingController();
  final _gasolinaController = TextEditingController();
  final _dataatualController = TextEditingController();
  String opcao = "";

  Comparacao _comparacaoTemp;

   void melhorOpcao(){
     setState(() {

      double gasolina = double.parse(_gasolinaController.text);
      double etanol = double.parse(_etanolController.text);  
      double x = etanol / gasolina;
      if (x < 0.7) {
         opcao = "Etanol";
        print ("$opcao");      
      } else {
         opcao = "Gasolina";
        print ("$opcao");
      }
    });
  }

  _onClear() {
    setState(() {
      _textFieldController.text = "";
    });
  }

 

  Future salvar() async{
    
  }


//@override
//void initState() { 
   //super.initState();
  //_comparacaoTemp = Comparacao.fromMap(widget.comparacao.toMap());
   //_postoController.text = _comparacaoTemp.posto;
  //_etanolController.text = _comparacaoTemp.precoEtanol;
  //_gasolinaController.text = _comparacaoTemp.precoGasolina;
  //_dataatualController.text = _comparacaoTemp.dataAtual;
   
// }


  

  TextEditingController _textFieldController = TextEditingController();


//Informações sobre o APP
  //PackageInfo packageInfo = await PackageInfo.fromPlatform();

  //String appName = packageInfo.appName;
  //String packageName = packageInfo.packageName;
  //String version = packageInfo.version;
 // String buildNumber = packageInfo.buildNumber;



//inicio limpar campos
  
  
  void _limparCampos(){
    _gasolinaController.text= "";
    _etanolController.text= "";
    _postoController.text= "";
    _dataatualController.text= "";

  }
//fim limpar campos

Widget botaoOK = FlatButton(
    child: Text("OK"),
    onPressed: () {          
    },
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
              
              onChanged: (text){
                //_comparacaoEdited = true;
                 _comparacaoTemp.posto = text;
                },
                controller: _postoController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Preço do Etanol", labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              keyboardType: TextInputType.number,              
              onChanged: (text){
                //_comparacaoEdited = true;
                _comparacaoTemp.precoEtanol = text;
                },
              controller: _etanolController,


            ),
            TextField(
              decoration: InputDecoration(labelText: "Preço da Gasolina", labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              keyboardType: TextInputType.number,
              
              onChanged: (text){
                //_comparacaoEdited = true;
                 _comparacaoTemp.precoGasolina = text;
                },
                controller: _gasolinaController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Data Atual",labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              style: TextStyle(color: Colors.blue),
              keyboardType: TextInputType.datetime,
              
              onChanged: (text){
                //_comparacaoEdited = true;
                 _comparacaoTemp.dataAtual = text;
                },
                controller: _dataatualController,
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
                        salvar();
                        melhorOpcao();
                        showDialog(
                          context: context,
                          builder: (ctxt) => new AlertDialog(
                          title: Text("Resultado"),
                          content: Text("Para o abastecimento com $opcao e mais Vantajoso!"),

                          
                          actions: <Widget>[
                            //botaoOK
                            
                            FlatButton(
                              child: Text("OK"),                              
                                onPressed: () {
                                  _onClear();
                                  Navigator.pop(context);
                                  _limparCampos();
                                  
                                     
                                },
                              )                            
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
    //return Container();    
 }
 

}