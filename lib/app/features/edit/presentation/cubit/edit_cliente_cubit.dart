import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_cliente_state.dart';

class EditClienteCubit extends Cubit<EditClienteState> {
  EditClienteCubit() : super(EditClienteInitial());
}
