import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/pages/prestamos/prestamo_controller.dart';
import 'package:get/get.dart';

class PrestamoPage extends StatelessWidget {
  PrestamoPage({super.key});
  final PrestamoController controller = PrestamoController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrestamoController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Prestamos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Stack(),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.goToAddPrestamo,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
