import 'package:hive/hive.dart';

part 'cliente_entity.g.dart';

@HiveType(typeId: 0)
class ClienteEntity extends HiveObject {
  ClienteEntity({
    this.id,
    this.nome,
    this.telefone,
    this.email,
    this.endereco,
  });
  @HiveField(0)
  String id;
  @HiveField(1)
  String nome;
  @HiveField(2)
  String telefone;
  @HiveField(3)
  String email;
  @HiveField(4)
  String endereco;
}
