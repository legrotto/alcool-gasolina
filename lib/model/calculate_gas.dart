class Calculos {
  String id;
  String combustivel;
  String preco;
  String data;

  Calculos(this.id, this.combustivel, this.preco, this.data);

  Calculos.fromMap(Map<String, dynamic> map, String id) {
    this.id = id ?? '';
    this.combustivel = map['combustivel'];
    this.preco = map['preco'];
    this.data = map['data'];
  }
}
