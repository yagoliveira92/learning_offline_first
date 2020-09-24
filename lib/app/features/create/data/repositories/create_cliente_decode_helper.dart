import 'package:dartz/dartz.dart';
import 'package:learning_offline_first/app/api/api_result.dart';
import 'package:learning_offline_first/app/api/api_sucess_result.dart';
import 'package:learning_offline_first/app/api/erro_api.dart';
import 'package:meta/meta.dart';

class CreateClienteDecodeHelper {
  Either<String, bool> decodeCreateCliente({@required ApiResult result}) {
    if (result is ApiSuccess) {
      return Right(true);
    }
    return Left(Erro.construirErro(result).mensagem);
  }
}
