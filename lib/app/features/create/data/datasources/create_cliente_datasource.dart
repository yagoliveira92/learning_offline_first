import 'package:learning_offline_first/app/core/firebase_instance.dart';
import 'package:meta/meta.dart';
import 'package:learning_offline_first/app/api/api_error_result.dart';
import 'package:learning_offline_first/app/api/api_sucess_result.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';

class CreateClienteDataSource {
  CreateClienteDataSource({@required this.firebaseInstance});

  final FirebaseInstance firebaseInstance;

  Future addCliente(ClienteModel clienteModel) async {
    try {
      await firebaseInstance.clientesCollectionReference
          .add(clienteModel.toMap());
      return ApiSuccess(sucesso: true);
    } catch (erro) {
      return ApiError(mensagem: erro.toString());
    }
  }
}
