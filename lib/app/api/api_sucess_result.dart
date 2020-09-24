import 'package:meta/meta.dart';
import 'package:learning_offline_first/app/api/api_result.dart';

class ApiSuccess implements ApiResult {
  ApiSuccess({
    @required this.sucesso,
  });

  final dynamic sucesso;
}
