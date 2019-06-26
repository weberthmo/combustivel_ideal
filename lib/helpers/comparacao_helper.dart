
import 'package:combustivel_ideal/model/comparacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ComparacaoHelper {

  static final ComparacaoHelper _instance = ComparacaoHelper.internal();
  ComparacaoHelper.internal();
  factory ComparacaoHelper() => _instance;
  Database _db;

  Future<Database> get db async {
  if (_db != null) {
    return _db;    
  }
    _db = await initDb();
    return _db;
}




Future<Database> initDb() async {
  final path = await getDatabasesPath();
  final pathDB = join(path, "comparacao.db");

      final String sql = "CREATE TABLE comparacao ("
        "c_id INTEGER PRIMARY KEY,"
        "c_posto TEXT,"
        "c_precoEtanol TEXT,"
        "c_precoGasolina TEXT,"
        "c_dataAtual TEXT"
      ")";

      return await openDatabase(
        pathDB,
        version: 1,
        onCreate: (Database db, int newerVersion) async{
          await db.execute(sql);
        }          
  );      
}

//Create
Future<Comparacao> insert(Comparacao comparacao) async{
    Database dbComparacao = await db;
    comparacao.id = await dbComparacao.insert("comparacao", comparacao.toMap());
    return comparacao;
  }

  //read por id
  Future<Comparacao> selectById(int id) async{
    Database dbComparacao = await db;
    List<Map> maps = await dbComparacao.query("comparacao",
      columns: [
        "c_id", "c_posto", "c_precoEtanol", "c_precoGasolina", "c_dataAtual" 
      ],
      where: "C_id = ?",
      whereArgs: [id]    
    );
    if (maps.length > 0) {
      return Comparacao.fromMap(maps.first);
    }else{
      return null;
    }    
  }

  //read
  Future<List> selectAll() async{
    Database dbComparacao = await db;
    List list = await dbComparacao.rawQuery("SELECT * FROM comparacao");
    List<Comparacao> lsComparacao = List();
    for (Map m in list){
      lsComparacao.add(Comparacao.fromMap(m));
    }
    return lsComparacao;
  }

  //update
  Future<int> update (Comparacao comparacao) async{
    Database dbComparacao = await db;
    return await dbComparacao.update("comparacao", comparacao.toMap(), where: "c_id = ?",
      whereArgs: [comparacao.id]);
  }

  //delete
  Future<int> delete (int id) async{
    Database dbComparacao = await db;
    return await dbComparacao.delete("comparacao", where: "c_id = ?", whereArgs: [id]);
  }

  //fechar banco de dados
  Future close() async{
    Database dbComparacao = await db;
    dbComparacao.close();
  }
}







  

