import 'package:dartz/dartz.dart';

abstract class IDeleteClienteRepository {
  Future<Either<String, bool>> deleteCliente(String clienteId);
}
