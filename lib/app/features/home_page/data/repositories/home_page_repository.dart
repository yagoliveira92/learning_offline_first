import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/api/api_sucess_result.dart';
import 'package:learning_offline_first/app/api/erro_api.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';
import 'package:learning_offline_first/app/features/home_page/data/datasources/home_page_datasource.dart';
import 'package:learning_offline_first/app/features/home_page/domain/repositories/ihome_page_repository.dart';
import 'package:meta/meta.dart';

class HomePageRepository implements IHomePageRepository {
  HomePageRepository({@required this.homePageDataSource});

  final HomePageDataSource homePageDataSource;

  @override
  Future<Either<String, List<ClienteEntity>>> getAllClientes() async {
    final apiResult = await homePageDataSource.getAll();
    if (apiResult is ApiSuccess) {
      List<ClienteEntity> clientes = List<ClienteModel>.from(
        apiResult.sucesso.documents
            .map(
              (snapshot) => ClienteModel.fromMap(snapshot.data(), snapshot.id),
            )
            .toList(),
      );
      return Right(clientes);
    }
    return Left(Erro.construirErro(apiResult).mensagem);
  }
}
