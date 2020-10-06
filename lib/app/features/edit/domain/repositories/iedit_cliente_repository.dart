import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';

abstract class IEditClienteRepository {
  Future<Either<String, bool>> editCliente(ClienteEntity cliente);
}
