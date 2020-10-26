import 'package:flutter_test/flutter_test.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';

void main() {
  final tClienteModel = ClienteModel(
      id: '123',
      nome: 'Moacir CDP',
      telefone: '799999999',
      email: 'yago@test.agrosmart.com.br',
      endereco: 'Rua dos Alfeneiros 4');

  const tJson =
      '{"nome": "Moacir CDP", "telefone":"799999999", "email":"yago@test.agrosmart.com.br","endereco":"Rua dos Alfeneiros 4"}';

  final tExpectedMap = {
    'id': '123',
    'nome': 'Moacir CDP',
    'telefone': '799999999',
    'email': 'yago@test.agrosmart.com.br',
    'endereco': 'Rua dos Alfeneiros 4'
  };
  test('Deve retornar uma instância de ClienteEntity', () {
    expect(tClienteModel, isA<ClienteEntity>());
  });

  test('Deve retornar um model válido', () {
    final result = ClienteModel.fromJson(tJson, '123');
    expect(result, isA<ClienteEntity>());
  });

  test('Deve retornar um Json Map', () {
    final result = tClienteModel.toMap();
    expect(result, tExpectedMap);
  });
}
