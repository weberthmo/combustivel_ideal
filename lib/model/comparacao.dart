
//objeto Usuário
class Comparacao {
 int id;
 String posto;
 String precoEtanol;
 String precoGasolina;
 String dataAtual;

 //constutor 
 Comparacao();



 Comparacao.fromMap(Map map){

  id = map["c_id"];
  posto = map["c_posto"];
  precoEtanol = map["c_precoEtanol"];
  precoGasolina = map["c_precoGasolina"];
  dataAtual = map["c_dataAtual"];

  }
  Map toMap(){
    Map<String, dynamic> map = {
      "c_posto": posto,
      "c_precoEtanol": precoEtanol,
      "c_precoGasolina": precoGasolina,
      "c_dataAtual": dataAtual,
    };
    if (id != null) {
      map["c_id"] = id;
      
    }
    return map;
  }

  @override
  String toString() {
    return "Comparacao[ id: $id, "
          "posto: $posto, "
          "precoEtanol: $precoEtanol, "
          "precoGasolina: $precoGasolina, "
          "dataAtual: $dataAtual"
    "]";
  }

}