import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/pages/cliente/add_cliente_controller.dart';
import 'package:flutter_app/src/ui/widgets/input_widget.dart';
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
                InputWidget(
                  hintText: 'name',
                  iconData: Icons.abc,
                  keyboardType: TextInputType.name,
                  onChanged: controller.onChangedName,
                  initialValue: controller.clienteSeleccionado?.name,
                ),
                InputWidget(
                  hintText: 'lastName',
                  iconData: Icons.abc,
                  keyboardType: TextInputType.name,
                  onChanged: controller.onChangedLastName,
                  initialValue: controller.clienteSeleccionado?.lastName,
                ),
                InputWidget(
                  hintText: 'address',
                  iconData: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: controller.onChangedAddress,
                  initialValue: controller.clienteSeleccionado?.address,
                ),
                InputWidget(
                  hintText: 'latitude',
                  iconData: Icons.abc_sharp,
                  keyboardType: TextInputType.name,
                  onChanged: controller.onChangedLatitude,
                  initialValue: controller.clienteSeleccionado?.latitude,
                ),
                InputWidget(
                  hintText: 'longitude',
                  iconData: Icons.abc,
                  keyboardType: TextInputType.name,
                  onChanged: controller.onChangedLongitude,
                  initialValue: controller.clienteSeleccionado?.longitude,
                ),
                InputWidget(
                  hintText: 'idTypeDocument',
                  iconData: Icons.numbers,
                  keyboardType: TextInputType.number,
                  onChanged: (p0) => controller.onChangedIdTypeDocument,
                  initialValue:
                      controller.clienteSeleccionado?.idTypeDocument.toString(),
                ),
                InputWidget(
                  hintText: 'document',
                  iconData: Icons.perm_identity_sharp,
                  keyboardType: TextInputType.number,
                  onChanged: controller.onChangedDocument,
                  initialValue: controller.clienteSeleccionado?.document,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap:
              controller.editando ? controller.edit : controller.createCliente,
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
}
