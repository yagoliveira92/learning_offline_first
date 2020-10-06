import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/api/api_sucess_result.dart';
import 'package:learning_offline_first/app/api/erro_api.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';
import 'package:learning_offline_first/app/features/create/data/datasources/create_cliente_datasource.dart';
import 'package:meta/meta.dart';
import 'package:learning_offline_first/app/features/create/domain/repositories/icreate_cliente_repository.dart';

class CreateClienteRepository implements ICreateClienteRepository {
  CreateClienteRepository({@required this.clienteDataSource});

  final CreateClienteDataSource clienteDataSource;

  @override
  Future<Either<String, bool>> criarCliente(ClienteModel clienteModel) async {
    final apiResult = await clienteDataSource.addCliente(clienteModel);
    if (apiResult is ApiSuccess) {
      return Right(true);
    }
    return Left(Erro.construirErro(apiResult).mensagem);
  }
}
