import 'package:learning_offline_first/app/core/firebase_instance.dart';
import 'package:meta/meta.dart';
import 'package:learning_offline_first/app/api/api_error_result.dart';
import 'package:learning_offline_first/app/api/api_sucess_result.dart';

class HomePageDataSource {
  HomePageDataSource({@required this.firebaseInstance});

  final FirebaseInstance firebaseInstance;

  Future getAll() async {
    try {
      var clientesDocuments =
          await firebaseInstance.clientesCollectionReference.get();

      return ApiSuccess(sucesso: clientesDocuments);
    } catch (erro) {
      return ApiError(mensagem: erro.toString());
    }
  }
}
