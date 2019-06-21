import 'dart:io';
import 'package:combustivel_ideal/model/comparacao.dart';
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
  //final String ComparacaoRealizadas = "ComparacaoRealizadas";
  final String tabelaComparacao = "ComparacaoRealizadas";
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
    _db = await initBb();
      return _db;
  }
  

  //Construtor
  BDadosAjudante.internal();


  //função para criar base de dados
  initBb() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String caminho = join(
      documentoDiretorio.path, "bd_principal.db"
    );  
    var nossoBD = await openDatabase(caminho, version: 1, onCreate: _onCreate);
    return nossoBD;
      }

      //metodo
     // FutureOr<void> _onCreate(Database db, int version) async {
      void _onCreate(Database db, int version) async {
        await db.execute(
          "CREAT TABLE $tabelaComparacao($colunaId INTEGER PRIMARY KEY,"
          "$colunaNomePosto STRING"
          "$colunaPrecoEtanol DOUBLE"
          "$colunaPrecoGasolina DOUBLE"
          "$colunaDataAtual DATETIME)");
        
  }
  //inserir
  Future<int> inserirComparacao(Comparacao comparacao) async{
    var bdComparacao = await db;
    int res = await bdComparacao.insert("$tabelaComparacao", comparacao.toMap());
    return res;

  }
  //retirar
  Future<List> trazerComparacoes() async{
    var bdComparacao = await db;
    var res = await bdComparacao.rawQuery("SELECT * FROM $tabelaComparacao");
    return res.toList();
  }
  //Contagem
  Future<int> contagemComparacoes() async{
        var bdComparacao = await db; 
        return Sqflite.firstIntValue(
          await bdComparacao.rawQuery("SELECT COUNT (*) FROM $tabelaComparacao") );

  }
  //Pegar usuario ataves atraves da sua ID
  Future<Comparacao> pegarPostos(int id) async{
    var bdComparacao = await db;
    var res = await bdComparacao.rawQuery(
      "SELECT * FROM $tabelaComparacao"
      " WHERE $colunaId = $id");
    if (res.length == 0) return null;
    return new Comparacao.fromMap(res.first);
      
    }
    //Apagar-Deletar
    Future<int> apagarComparacoes(int id) async{
      var bdComparacao = await db;

      return await bdComparacao.delete(
        "SELECT * FROM $tabelaComparacao"
        " WHERE $colunaId = ?", whereArgs: [id]);
    }
    //atualizar comparações
    Future<int> atualizarComparacoes(Comparacao comparacao) async{
      var bdComparacao = await db;
      return await bdComparacao.update(tabelaComparacao,
      comparacao.toMap(), where: "$colunaId = ?", whereArgs: [comparacao.id] );
    }

    //fechar base de dados
    Future fecharBd() async{
      var bdComparacao = await db;
      return bdComparacao.close();
    }
  }
    
