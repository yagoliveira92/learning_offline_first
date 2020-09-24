import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning_offline_first/app/core/routers/routers.dart';
import 'package:learning_offline_first/app/core/injection_container.dart'
    as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  await Firebase.initializeApp();
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
