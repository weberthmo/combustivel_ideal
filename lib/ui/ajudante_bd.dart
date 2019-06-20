import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';


class BDadosAjudante {
  //varial que nao muda
  static final BDadosAjudante _instance = new BDadosAjudante.internal();

  //faz com que a classe não seja recriada sempre que seja chamada
  factory BDadosAjudante() => _instance;

  //esqueleto da base de dados a ser criada
  final String ComparacaoRealizadas = "ComparacaoRealizadas";
  final String colunaId = "id";
  final String colunaNomePosto = "posto";
  final String colunaPrecoEtanol = "precoEtanol";
  final String colunaPrecoGasolina = "precoGasolina";
  final String colunaDataAtual = "dataAtual";

  //classe Database já vem com o sqflite
  static Database _db;
  //Para acessar algo/fazer uma requisição utilizar Future
  Future<Database> get db async{
    if (_db != null) {
      return _db;
    }
    _db = await initBD();
  }
  

  //Construtor
  BDadosAjudante.internal();


  //função para criar base de dados
  initBD() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String caminho = join(
      documentoDiretorio.path, "bd_principal.db"
    );  
    var nossoBD = await openDatabase(caminho, version: 1, onCreate: _onCreate)
    return nossoBD;
      }

      //metodo
     // FutureOr<void> _onCreate(Database db, int version) async {
      void _onCreate(Database db, int version) async {
        await db.execute(
          "CREAT TABLE $ComparacaoRealizadas($colunaId INTEGER PRIMARY KEY,"
          "$colunaNomePosto STRING"
          "$colunaPrecoEtanol DOUBLE"
          "$colunaPrecoGasolina DOUBLE"
          "$colunaDataAtual DATETIME");
        
  }
  Future<int> inserComparacao() async{

  }
}