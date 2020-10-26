import 'package:hive/hive.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';
import 'package:meta/meta.dart';

class DatabaseDataSource {
  Future<bool> saveList({@required List<ClienteEntity> allContacts}) async {
    try {
      final contactsBox = await Hive.openBox<ClienteEntity>('contatos');
      contactsBox.clear();
      allContacts.forEach((cliente) {
        contactsBox.add(cliente);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ClienteEntity>> getList() async {
    final contactsBox = await Hive.openBox<ClienteEntity>('contatos');
    List<ClienteEntity> listContacts = contactsBox.values.toList();
    await contactsBox.close();
    return listContacts;
  }
}
