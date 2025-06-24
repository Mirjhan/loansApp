import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/pages/usuarios/usuario_controller.dart';
import 'package:get/get.dart';

class UsuarioPage extends StatelessWidget {
  UsuarioPage({super.key});
  final UsuarioController controller = UsuarioController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsuarioController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Usuarios',
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
              onRefresh: controller.getUsuarios,
              child: ListView.builder(
                itemCount: controller.usuarios.length,
                itemBuilder: (context, index) => itemListTile(
                    controller.usuarios[index].lastName,
                    'Administrador',
                    'x min'),
              ),
            ),
            GetBuilder<UsuarioController>(
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
      ),
    );
  }

  Widget itemListTile(String title, String subtitle, String trailing) {
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
        trailing: Text(
          trailing,
        ),
      ),
    );
  }
}
