import 'package:learning_offline_first/app/api/api_sucess_result.dart';
import 'package:learning_offline_first/app/api/erro_api.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/features/edit/data/datasources/edit_cliente_datasource.dart';
import 'package:meta/meta.dart';
import 'package:learning_offline_first/app/features/edit/domain/repositories/iedit_cliente_repository.dart';

class EditClienteRepository implements IEditClienteRepository {
  EditClienteRepository({@required this.editClienteDataSource});

  final EditClienteDataSource editClienteDataSource;

  @override
  Future<Either<String, bool>> editCliente(ClienteEntity cliente) async {
    final apiResult = await editClienteDataSource.editCliente(cliente);
    if (apiResult is ApiSuccess) {
      return Right(apiResult.sucesso);
    }
    return Left(Erro.construirErro(apiResult).mensagem);
  }
}
