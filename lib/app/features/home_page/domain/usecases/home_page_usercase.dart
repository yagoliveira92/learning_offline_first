import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';
import 'package:learning_offline_first/app/features/home_page/domain/repositories/ihome_page_repository.dart';
import 'package:meta/meta.dart';

class HomePageUserCase {
  HomePageUserCase({@required this.homePageRepository});

  final IHomePageRepository homePageRepository;

  Future<Either<String, List<ClienteEntity>>> call() async {
    final result = await homePageRepository.getAllClientes();
    return result.fold(
      (erro) => Left<String, List<ClienteEntity>>(erro),
      (result) async {
        return Right<String, List<ClienteEntity>>(result);
      },
    );
  }
}
