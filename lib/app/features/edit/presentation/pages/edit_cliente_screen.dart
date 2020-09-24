import 'package:flutter/material.dart';

class EditClienteScreen extends StatelessWidget {
  const EditClienteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Cliente'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, true),
        ),
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
