part of 'create_cliente_cubit.dart';

@immutable
abstract class CreateClienteState {}

class CreateClienteInitial extends CreateClienteState {}

class CreateClienteCriando extends CreateClienteState {}

class CreateClienteSucesso extends CreateClienteState {}

class CreateClienteErro extends CreateClienteState {}

class CreateClienteInvalido extends CreateClienteState {}
