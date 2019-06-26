
import 'package:combustivel_ideal/helpers/comparacao_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:combustivel_ideal/page/historico_page.dart';
//import 'package:combustivel_ideal/model/comparacao.dart';


class Home extends StatefulWidget {
  
  @override

  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  ComparacaoHelper helper = ComparacaoHelper();

  @override
  void initState() { 
    super.initState();
  }

  TextEditingController _textFieldController = TextEditingController();

  _onClear() {
    setState(() {
      _textFieldController.text = "";
    });
  }

//Informações sobre o APP
  //PackageInfo packageInfo = await PackageInfo.fromPlatform();

  //String appName = packageInfo.appName;
  //String packageName = packageInfo.packageName;
  //String version = packageInfo.version;
 // String buildNumber = packageInfo.buildNumber;
//


//inicio limpar campos
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController etanolController = TextEditingController();
  TextEditingController postoController = TextEditingController();
  TextEditingController dataController = TextEditingController();

  void _limparCampos(){
    gasolinaController.text= "";
    etanolController.text= "";
    postoController.text= "";
    dataController.text= "";

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
              controller: postoController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Preço do Etanol", labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              keyboardType: TextInputType.number,
              controller: etanolController,

            ),
            TextField(
              decoration: InputDecoration(labelText: "Preço da Gasolina", labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              keyboardType: TextInputType.number,
              controller: gasolinaController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Data Atual", labelStyle: TextStyle(color: Colors.blue[900], fontSize: 20)),
              style: TextStyle(color: Colors.blue),
              keyboardType: TextInputType.datetime,
              controller: dataController,
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
      
      bottomNavigationBar: BottomAppBar(
        child: Text("Teste" , textAlign: TextAlign.center,),
        color: Colors.blue,
        
      ),     
    );
  }
  @override
  Widget build(BuildContext context) {
    return buildScaffold();
    //return Container();    
 }
}