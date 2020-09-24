import 'package:learning_offline_first/app/api/api_sucess_result.dart';
import 'package:learning_offline_first/app/api/erro_api.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/features/delete/data/datasources/delete_cliente_datasource.dart';
import 'package:meta/meta.dart';
import 'package:learning_offline_first/app/features/delete/domain/repositories/idelete_cliente_repository.dart';

class DeleteClienteRepository implements IDeleteClienteRepository {
  DeleteClienteRepository({@required this.deleteClienteDataSource});

  final DeleteClienteDataSource deleteClienteDataSource;

  @override
  Future<Either<String, ClienteEntity>> deleteCliente(String clienteId) async {
    final apiResult = await deleteClienteDataSource.deleteCliente(clienteId);
    if (apiResult is ApiSuccess) {
      ClienteEntity cliente = ClienteModel.fromJson(
        apiResult.sucesso.documents.map(
          (snapshot) => ClienteModel.fromMap(snapshot.data(), snapshot.id),
        ),
      );
      return Right(cliente);
    }
    return Left(Erro.construirErro(apiResult).mensagem);
  }
}
