import 'package:learning_offline_first/app/api/api_error_result.dart';
import 'package:learning_offline_first/app/api/api_sucess_result.dart';
import 'package:learning_offline_first/app/core/firebase_instance.dart';
import 'package:meta/meta.dart';

class DeleteClienteDataSource {
  DeleteClienteDataSource({@required this.firebaseInstance});

  final FirebaseInstance firebaseInstance;

  Future deleteCliente(String clienteId) async {
    try {
      await firebaseInstance.clientesCollectionReference
          .doc(clienteId)
          .delete();
      return ApiSuccess(sucesso: true);
    } catch (erro) {
      return ApiError(mensagem: erro.toString());
    }
  }
}
