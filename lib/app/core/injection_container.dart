import 'package:get_it/get_it.dart';
import 'package:learning_offline_first/app/core/firebase_instance.dart';
import 'package:learning_offline_first/app/features/create/data/datasources/create_cliente_datasource.dart';
import 'package:learning_offline_first/app/features/create/data/repositories/create_cliente_decode_helper.dart';
import 'package:learning_offline_first/app/features/create/data/repositories/create_cliente_repository.dart';
import 'package:learning_offline_first/app/features/create/domain/repositories/icreate_cliente_repository.dart';
import 'package:learning_offline_first/app/features/create/domain/usecases/create_cliente_user_case.dart';
import 'package:learning_offline_first/app/features/create/presentation/cubit/create_cliente_cubit.dart';
import 'package:learning_offline_first/app/features/delete/data/datasources/delete_cliente_datasource.dart';
import 'package:learning_offline_first/app/features/delete/data/repositories/delete_cliente_repository.dart';
import 'package:learning_offline_first/app/features/delete/domain/repositories/idelete_cliente_repository.dart';
import 'package:learning_offline_first/app/features/delete/domain/usecases/delete_cliente_usercase.dart';
import 'package:learning_offline_first/app/features/home_page/data/datasources/home_page_datasource.dart';
import 'package:learning_offline_first/app/features/home_page/data/repositories/home_page_repository.dart';
import 'package:learning_offline_first/app/features/home_page/domain/repositories/ihome_page_repository.dart';
import 'package:learning_offline_first/app/features/home_page/domain/usecases/home_page_usercase.dart';
import 'package:learning_offline_first/app/features/home_page/presentation/cubit/home_page_cubit.dart';

final dependencia = GetIt.instance;

Future<void> init() async {
  dependencia.registerLazySingleton(() => FirebaseInstance());

  dependencia.registerLazySingleton(
    () => CreateClienteDataSource(
      firebaseInstance: dependencia(),
    ),
  );

  dependencia.registerFactory(() => CreateClienteDecodeHelper());

  dependencia.registerFactory(
    () => CreateClienteCubit(
      criarClienteUserCase: dependencia(),
    ),
  );

  dependencia.registerFactory<ICreateClienteRepository>(
    () => CreateClienteRepository(
      clienteDataSource: dependencia(),
      clienteDecodeHelper: dependencia(),
    ),
  );

  dependencia.registerFactory(
    () => CreateClienteUserCase(
      createClienteRepository: dependencia(),
    ),
  );

  dependencia.registerLazySingleton(
    () => HomePageDataSource(
      firebaseInstance: dependencia(),
    ),
  );

  dependencia.registerFactory(
    () => HomePageCubit(
      homePageUserCase: dependencia(),
      deleteClienteUserCase: dependencia(),
    ),
  );

  dependencia.registerFactory<IHomePageRepository>(
    () => HomePageRepository(
      homePageDataSource: dependencia(),
    ),
  );

  dependencia.registerFactory(
    () => HomePageUserCase(
      homePageRepository: dependencia(),
    ),
  );

  dependencia.registerLazySingleton(
    () => DeleteClienteDataSource(
      firebaseInstance: dependencia(),
    ),
  );

  dependencia.registerFactory<IDeleteClienteRepository>(
    () => DeleteClienteRepository(
      deleteClienteDataSource: dependencia(),
    ),
  );

  dependencia.registerFactory(
    () => DeleteClienteUserCase(
      deleteClienteRepository: dependencia(),
    ),
  );
}
