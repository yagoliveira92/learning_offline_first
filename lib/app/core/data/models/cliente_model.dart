import 'dart:convert';

import 'package:meta/meta.dart';

import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';

class ClienteModel extends ClienteEntity {
  ClienteModel(
      {String id,
      @required String nome,
      @required String telefone,
      @required String email,
      @required String endereco})
      : super(
            id: id,
            nome: nome,
            telefone: telefone,
            email: email,
            endereco: endereco);

  ClienteModel copyWith({
    String id,
    String nome,
    String telefone,
    String email,
    String endereco,
  }) {
    return ClienteModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
      endereco: endereco ?? this.endereco,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'endereco': endereco,
    };
  }

  factory ClienteModel.fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return ClienteModel(
      id: documentId,
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
      endereco: map['endereco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClienteModel.fromJson(String source, String documentId) =>
      ClienteModel.fromMap(json.decode(source), documentId);

  @override
  String toString() {
    return 'ClienteModel(id: $id, nome: $nome, telefone: $telefone, email: $email, endereco: $endereco)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ClienteModel &&
        o.id == id &&
        o.nome == nome &&
        o.telefone == telefone &&
        o.email == email &&
        o.endereco == endereco;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        telefone.hashCode ^
        email.hashCode ^
        endereco.hashCode;
  }
}
