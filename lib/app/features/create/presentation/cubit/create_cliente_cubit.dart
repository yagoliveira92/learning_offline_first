import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';
import 'package:learning_offline_first/app/features/create/domain/usecases/create_cliente_user_case.dart';
import 'package:meta/meta.dart';

part 'create_cliente_state.dart';

class CreateClienteCubit extends Cubit<CreateClienteState> {
  CreateClienteCubit({@required this.criarClienteUserCase})
      : super(CreateClienteInitial());

  final CreateClienteUserCase criarClienteUserCase;

  Future<void> criarCliente(
      {@required String nome,
      @required String telefone,
      @required String endereco,
      @required String email,
      @required GlobalKey<FormState> formkey}) async {
    ClienteModel novoCliente = ClienteModel(
        nome: nome, telefone: telefone, email: email, endereco: endereco);
    emit(CreateClienteCriando());
    if (!formkey.currentState.validate()) {
      emit(CreateClienteInvalido());
      return;
    }
    final result = await criarClienteUserCase(novoCliente);
    result.fold(
      (erro) => emit(CreateClienteErro()),
      (sucesso) {
        formkey.currentState.reset();
        emit(CreateClienteSucesso());
      },
    );
  }
}
