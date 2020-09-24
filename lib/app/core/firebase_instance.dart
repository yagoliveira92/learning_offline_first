import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseInstance {
  final CollectionReference clientesCollectionReference =
      FirebaseFirestore.instance.collection('clientes');
}
