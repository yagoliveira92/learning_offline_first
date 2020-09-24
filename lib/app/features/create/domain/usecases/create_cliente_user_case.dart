import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';
import 'package:learning_offline_first/app/features/create/domain/repositories/icreate_cliente_repository.dart';
import 'package:meta/meta.dart';

class CreateClienteUserCase {
  CreateClienteUserCase({@required this.createClienteRepository});

  final ICreateClienteRepository createClienteRepository;

  Future<Either<String, bool>> call(ClienteModel novoCliente) async {
    final result = await createClienteRepository.criarCliente(novoCliente);
    return result.fold(
      (erro) => Left<String, bool>(erro),
      (result) async {
        return Right<String, bool>(result);
      },
    );
  }
}
