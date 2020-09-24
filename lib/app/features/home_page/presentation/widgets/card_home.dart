import 'package:learning_offline_first/app/core/data/models/cliente_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class CardCliente extends StatelessWidget {
  const CardCliente(
      {@required this.cliente,
      @required this.navegacaoEditar,
      @required this.funcaoParaExcluir,
      @required this.chave,
      @required this.funcaoDismissed});

  final ClienteModel cliente;
  final VoidCallback navegacaoEditar;
  final VoidCallback funcaoParaExcluir;
  final VoidCallback funcaoDismissed;
  final String chave;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: editFunction(),
      secondaryBackground: deleteFunction(),
      confirmDismiss: (direction) => confirmAction(
          context: context,
          direcao: direction,
          nome: cliente.nome,
          navegacaoEditar: navegacaoEditar,
          funcaoParaExcluir: funcaoParaExcluir),
      onDismissed: (direction) => funcaoDismissed,
      child: Card(
        color: Colors.grey[100],
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(cliente.nome),
              Text(cliente.email),
              Text(cliente.telefone)
            ],
          ),
        ),
      ),
    );
  }
}

Widget editFunction() {
  return Container(
    color: Colors.green,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            ' Editar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}

Widget deleteFunction() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
          Text(
            ' Deletar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}

Future<bool> confirmAction(
    {BuildContext context,
    DismissDirection direcao,
    String nome,
    VoidCallback navegacaoEditar,
    VoidCallback funcaoParaExcluir}) async {
  if (direcao == DismissDirection.endToStart) {
    final bool res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Tem certeza que deseja deletar o $nome?'),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Não",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  "Sim",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  funcaoParaExcluir();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
    return res;
  } else {
    navegacaoEditar();
    return false;
  }
}
