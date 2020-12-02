class Usuarios {
  String id;
  String nome;
  String email;
  String senha;
  bool status;

  Usuarios(this.id, this.nome, this.email, this.senha, this.status);

  Usuarios.fromMap(Map<String, dynamic> map, String id) {
    this.id = id ?? '';
    this.nome = map['nome'];
    this.email = map['email'];
    this.senha = map['senha'];
    this.status = map['status'];
  }
}
