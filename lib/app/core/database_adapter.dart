import 'package:hive/hive.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';

final db = Hive;

Future<void> init() async {
  db.registerAdapter<ClienteEntity>(ClienteEntityAdapter());
}
