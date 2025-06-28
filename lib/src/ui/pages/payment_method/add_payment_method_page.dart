import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/pages/payment_method/add_payment_method_controller.dart';
import 'package:flutter_app/src/ui/widgets/input_widget.dart';
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
                InputWidget(
                  hintText: 'name',
                  iconData: Icons.abc,
                  keyboardType: TextInputType.name,
                  onChanged: controller.onChangedName,
                  initialValue: controller.metodoSeleccionado?.name,
                ),
                InputWidget(
                  hintText: 'description',
                  iconData: Icons.abc,
                  keyboardType: TextInputType.text,
                  onChanged: controller.onChangedDescription,
                  initialValue: controller.metodoSeleccionado?.description,
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
}
