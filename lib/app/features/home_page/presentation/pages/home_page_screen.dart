import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_offline_first/app/core/domain/entities/cliente_entity.dart';
import 'package:learning_offline_first/app/core/injection_container.dart';
import 'package:learning_offline_first/app/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:learning_offline_first/app/features/home_page/presentation/widgets/card_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ClienteEntity> clientes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Offline First'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/create-cliente');
                },
                child: Icon(
                  Icons.person_add,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: BlocProvider<HomePageCubit>(
        create: (_) => dependencia<HomePageCubit>(),
        child: BlocConsumer<HomePageCubit, HomePageState>(
          listener: (context, state) {
            if (state is HomePageClienteDeletado) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('O cliente foi excluído!')),
              );
            }
          },
          builder: (context, state) {
            print(state);
            if (state is HomePageInitial) {
              context.bloc<HomePageCubit>().getAllCliente();
            }
            if (state is HomePageCarregado) {
              clientes = context.bloc<HomePageCubit>().listaClientes;
              return RefreshIndicator(
                child: ListView.builder(
                  itemCount: clientes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardCliente(
                      cliente: clientes[index],
                      chave: index.toString(),
                      navegacaoEditar: () {
                        Navigator.pushNamed(context, '/edit-cliente');
                      },
                      funcaoDismissed: () => clientes.removeAt(index),
                      funcaoParaExcluir: () => context
                          .bloc<HomePageCubit>()
                          .deleteCliente(clientes[index].id),
                    );
                  },
                ),
                onRefresh: () => context.bloc<HomePageCubit>().getAllCliente(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.black,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
