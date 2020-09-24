import 'package:flutter/material.dart';
import 'package:learning_offline_first/app/features/create/presentation/pages/create_cliente_screen.dart';
import 'package:learning_offline_first/app/features/edit/presentation/pages/edit_cliente_screen.dart';
import 'package:learning_offline_first/app/features/home_page/presentation/pages/home_page_screen.dart';

Map<String, Widget Function(BuildContext)> routers = {
  '/': (context) => HomePage(),
  '/create-cliente': (context) => CreateClienteScreen(),
  '/edit-cliente': (context) => EditClienteScreen(),
};
