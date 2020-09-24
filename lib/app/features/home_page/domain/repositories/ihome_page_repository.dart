import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';

abstract class IHomePageRepository {
  Future<Either<String, List<ClienteEntity>>> getAllClientes();
}
