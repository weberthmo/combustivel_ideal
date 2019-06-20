
class Comparacao {
 int _id;
 String _posto;
 double _precoEtanol;
 double _precoGasolina;
 DateTime _dataAtual;

 //constutor 
 Comparacao(this._dataAtual, this._posto, this._precoEtanol, this._precoGasolina);

//construtor
Comparacao.map(dynamic obj){
  this._id = obj['id'];
  this._posto = obj['posto'];
  this._precoEtanol = obj['precoEtanol'];
  this._precoGasolina = obj['precoGasolina'];
  this._dataAtual = obj['dataAtual'];
}
int get id => _id;
String get posto => _posto;
double get precoEtanol => _precoEtanol;
double get precoGasolina=> _precoGasolina;
DateTime get dataAtual => _dataAtual;

Map<String, dynamic> toMap(){
  var mapa = new Map<String, dynamic>();
  
  mapa ["posto"] = _posto;
  mapa ["precoEtanol"] = _precoEtanol;
  mapa ["precoGasolina"] = _precoGasolina;
  mapa ["dataAtual"] = _dataAtual;
  if (id != null) {
    mapa ["id"] = _id;    
  }
  return mapa;

}

}