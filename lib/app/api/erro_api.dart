import 'package:learning_offline_first/app/api/api_error_result.dart';
import 'package:meta/meta.dart';
import 'package:learning_offline_first/app/api/api_result.dart';

class Erro extends ApiResult {
  Erro({
    @required this.mensagem,
  });

  final String mensagem;

  static Erro construirErro(ApiResult result) {
    if (result is ApiError) {
      return Erro(mensagem: result.mensagem);
    }
    return Erro(mensagem: 'Uma erro inesperado aconteceu');
  }
}
