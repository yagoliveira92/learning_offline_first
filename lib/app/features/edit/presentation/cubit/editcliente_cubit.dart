import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'editcliente_state.dart';

class EditClienteCubit extends Cubit<EditClienteState> {
  EditClienteCubit() : super(EditClienteInitial());
}
