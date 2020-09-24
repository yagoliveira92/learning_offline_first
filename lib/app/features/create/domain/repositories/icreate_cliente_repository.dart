import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';

abstract class ICreateClienteRepository {
  Future<Either<String, bool>> criarCliente(ClienteModel cliente);
}
