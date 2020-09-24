import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';
import 'package:learning_offline_first/app/features/create/data/datasources/create_cliente_datasource.dart';
import 'package:learning_offline_first/app/features/create/data/repositories/create_cliente_decode_helper.dart';
import 'package:meta/meta.dart';
import 'package:learning_offline_first/app/features/create/domain/repositories/icreate_cliente_repository.dart';

class CreateClienteRepository implements ICreateClienteRepository {
  CreateClienteRepository(
      {@required this.clienteDataSource, @required this.clienteDecodeHelper});

  final CreateClienteDataSource clienteDataSource;
  final CreateClienteDecodeHelper clienteDecodeHelper;

  @override
  Future<Either<String, bool>> criarCliente(ClienteModel clienteModel) async {
    final apiResult = await clienteDataSource.addCliente(clienteModel);
    return clienteDecodeHelper.decodeCreateCliente(result: apiResult);
  }
}
