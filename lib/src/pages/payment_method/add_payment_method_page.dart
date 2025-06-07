import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/payment_method/add_payment_method_controller.dart';
import 'package:get/get.dart';

class AddPaymentMethodPage extends StatelessWidget {
  AddPaymentMethodPage({super.key});
  final AddPaymentMethodController controller = AddPaymentMethodController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPaymentMethodController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.editando
                ? 'Editando Frecuencia de Pago'
                : 'Nueva Frecuencia de Pago',
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
                  controller.metodoSeleccionado?.name,
                ),
                inputWidget(
                  'description',
                  Icons.abc,
                  TextInputType.text,
                  controller.onChangedDescription,
                  controller.metodoSeleccionado?.description,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: controller.editando ? controller.edit : controller.send,
          child: Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 30, left: 30),
            decoration: BoxDecoration(
              color: Colors.red,
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
