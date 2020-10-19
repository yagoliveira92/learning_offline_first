import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:learning_offline_first/app/core/routers/routers.dart';
import 'package:learning_offline_first/app/core/injection_container.dart'
    as injection;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:learning_offline_first/app/core/database_adapter.dart'
    as db_adapter;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  await Firebase.initializeApp();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await db_adapter.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Offline First',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: routers,
    );
  }
}
