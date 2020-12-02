class Combustiveis {
  String id;
  String nome;
  String preco;

  Combustiveis(this.id, this.nome, this.preco);

  Combustiveis.fromMap(Map<String, dynamic> map, String id) {
    this.id = id ?? '';
    this.nome = map['nome'];
    this.preco = map['preco'];
  }
}
