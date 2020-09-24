import 'package:bloc/bloc.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';
import 'package:learning_offline_first/app/features/delete/domain/usecases/delete_cliente_usercase.dart';
import 'package:learning_offline_first/app/features/home_page/domain/usecases/home_page_usercase.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
      {@required this.homePageUserCase, @required this.deleteClienteUserCase})
      : super(HomePageInitial());

  final HomePageUserCase homePageUserCase;
  final DeleteClienteUserCase deleteClienteUserCase;
  List<ClienteEntity> listaClientes;

  Future<void> getAllCliente() async {
    emit(HomePageCarregando());
    final result = await homePageUserCase();
    result.fold(
      (erro) => emit(HomePageErro()),
      (clientes) {
        emit(HomePageCarregado());
        listaClientes = clientes;
      },
    );
  }

  Future<void> deleteCliente(String clienteId) async {
    final result = await deleteClienteUserCase(clienteId);
    result.fold(
      (erro) => emit(HomePageErro()),
      (result) {
        emit(HomePageClienteDeletado());
      },
    );
  }
}
