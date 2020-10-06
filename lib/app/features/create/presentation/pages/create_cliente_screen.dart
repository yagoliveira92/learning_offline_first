import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_offline_first/app/core/injection_container.dart';
import 'package:learning_offline_first/app/features/create/presentation/cubit/create_cliente_cubit.dart';

class CreateClienteScreen extends StatelessWidget {
  const CreateClienteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nomeController = TextEditingController();
    final telefoneController = TextEditingController();
    final emailController = TextEditingController();
    final enderecoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Cliente'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, true),
        ),
      ),
      body: BlocProvider<CreateClienteCubit>(
        create: (_) => dependencia<CreateClienteCubit>(),
        child: BlocConsumer<CreateClienteCubit, CreateClienteState>(
          listener: (context, state) {
            if (state is CreateClienteSucesso) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('O cliente foi criado com Sucesso!'),
                ),
              );
              clearForm(formKey);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: formKey,
                    initialValue: '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    key: formKey,
                    initialValue: '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    controller: telefoneController,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    key: formKey,
                    initialValue: '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    initialValue: '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: enderecoController,
                    decoration: InputDecoration(
                      labelText: 'Endereço',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      child: Text('Salvar'),
                      onPressed: () async {
                        await context.bloc<CreateClienteCubit>().criarCliente(
                              nome: nomeController.text,
                              email: emailController.text,
                              endereco: enderecoController.text,
                              telefone: telefoneController.text,
                              formkey: formKey,
                            );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void clearForm(GlobalKey<FormState> formkey) {
    formkey.currentState.reset();
  }
}
