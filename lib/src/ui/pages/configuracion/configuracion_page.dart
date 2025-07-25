import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/pages/configuracion/configuracion_controller.dart';
import 'package:get/get.dart';

class ConfiguracionPage extends StatelessWidget {
  ConfiguracionPage({super.key});
  final ConfiguracionController controller = ConfiguracionController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfiguracionController>(
        init: controller,
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Configuración',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.redAccent,
                centerTitle: true,
              ),
              body: Padding(
                padding: EdgeInsets.all(20),
                child: cards(),
              ),
            ));
  }

  Widget cards() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 1,
      children: [
        GestureDetector(
            onTap: controller.goToUsuarios,
            child: itemGridView('Usuarios', Icons.person)),
        GestureDetector(
          onTap: controller.goToPaymentFrequency,
          child: itemGridView(
              'Frecuencia de \n        Pago', Icons.social_distance_outlined),
        ),
        GestureDetector(
            onTap: controller.goToPaymentMethod,
            child: itemGridView(
                'Metodo de \n     Pago', Icons.credit_card_rounded)),
      ],
    );
  }

  Widget itemGridView(String texto, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // Sombra suave
            blurRadius: 10, // Difuminado de la sombra
            offset: Offset(1, 2), // Desplazamiento de la sombra
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.red,
            size: 40,
          ),
          Text(
            texto,
          )
        ],
      ),
    );
  }
}
