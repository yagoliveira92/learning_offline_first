import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/features/delete/domain/repositories/idelete_cliente_repository.dart';
import 'package:meta/meta.dart';

class DeleteClienteUserCase {
  DeleteClienteUserCase({@required this.deleteClienteRepository});

  final IDeleteClienteRepository deleteClienteRepository;

  Future<Either<String, bool>> call(String clienteId) async {
    final result = await deleteClienteRepository.deleteCliente(clienteId);
    return result.fold(
      (erro) => Left<String, bool>(erro),
      (result) async {
        return Right<String, bool>(result);
      },
    );
  }
}
