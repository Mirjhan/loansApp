import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/cliente/add_cliente_controller.dart';
import 'package:get/get.dart';

class AddClientePage extends StatelessWidget {
  AddClientePage({super.key});
  final AddClienteController controller = AddClienteController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddClienteController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Nuevo Cliente',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                inputWidget(
                  'name',
                  Icons.abc,
                  TextInputType.name,
                  controller.onChangedName,
                  controller.clienteSeleccionado?.name,
                ),
                inputWidget(
                  'lastName',
                  Icons.abc,
                  TextInputType.name,
                  controller.onChangedLastName,
                  controller.clienteSeleccionado?.lastName,
                ),
                inputWidget(
                    'address',
                    Icons.email,
                    TextInputType.emailAddress,
                    controller.onChangedAddress,
                    controller.clienteSeleccionado?.address),
                inputWidget(
                    'latitude',
                    Icons.abc_sharp,
                    TextInputType.name,
                    controller.onChangedLatitude,
                    controller.clienteSeleccionado?.latitude),
                inputWidget(
                    'longitude',
                    Icons.abc,
                    TextInputType.name,
                    controller.onChangedLongitude,
                    controller.clienteSeleccionado?.longitude),
                inputWidget(
                    'document',
                    Icons.perm_identity_sharp,
                    TextInputType.number,
                    controller.onChangedDocument,
                    controller.clienteSeleccionado?.document),
              ],
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: controller.editando ? controller.edit : controller.send,
          child: Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 30, left: 30),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Text(
              controller.editando ? 'Guardar' : 'Agregar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputWidget(String hintText, IconData icon, TextInputType keyboardType,
      void Function(String)? onChanged, String? initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: Colors.redAccent,
          ),
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
