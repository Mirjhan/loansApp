import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/cliente/cliente_controller.dart';
import 'package:get/get.dart';

class ClientePage extends StatelessWidget {
  ClientePage({super.key});
  final ClienteController controller = ClienteController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClienteController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Clientes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: controller.getClientes,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: controller.clientes.length,
                itemBuilder: (context, index) => itemListTile(
                    controller.clientes[index].fullName,
                    controller.clientes[index].address,
                    index),
              ),
            ),
            GetBuilder<ClienteController>(
              id: 'validando',
              builder: (controller) => controller.validando
                  ? Container(
                      alignment: Alignment.center,
                      color: Colors.black45,
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.goToAddClientePage(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget itemListTile(String title, String subtitle, int position) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            child: Icon(
              Icons.person,
              color: Colors.redAccent,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
          ),
          trailing: SizedBox(
            width: 96,
            child: Row(
              children: [
                IconButton(
                    onPressed: () => controller.goEditar(position),
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () => controller.goEliminar(position),
                    icon: Icon(Icons.delete)),
              ],
            ),
          )),
    );
  }
}
