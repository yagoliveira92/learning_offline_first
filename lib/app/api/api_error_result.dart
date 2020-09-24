import 'package:meta/meta.dart';
import 'package:learning_offline_first/app/api/api_result.dart';

class ApiError implements ApiResult {
  ApiError({
    @required this.mensagem,
  });

  final String mensagem;
}
