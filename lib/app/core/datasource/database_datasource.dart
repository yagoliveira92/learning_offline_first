import 'package:hive/hive.dart';
import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';
import 'package:meta/meta.dart';

class DatabaseDataSource {
  Future saveList({@required List<ClienteModel> allContacts}) async {
    final contactsBox = await Hive.openBox<ClienteEntity>('contatos');
    contactsBox.clear();
    allContacts.forEach((cliente) {
      contactsBox.add(cliente);
    });
    //await contactsBox.close();
  }

  Future<List<ClienteEntity>> getList() async {
    final contactsBox = await Hive.openBox<ClienteEntity>('contatos');
    List<ClienteEntity> listContacts = contactsBox.values.toList();
    await contactsBox.close();
    return listContacts;
  }
}
