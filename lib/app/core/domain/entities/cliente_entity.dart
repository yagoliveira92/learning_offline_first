import 'package:meta/meta.dart';

class ClienteEntity {
  ClienteEntity({
    this.id,
    @required this.nome,
    @required this.telefone,
    @required this.email,
    @required this.endereco,
  });
  String id;
  String nome;
  String telefone;
  String email;
  String endereco;
}
