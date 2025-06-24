import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/dashboard/drawer_widget.dart';
import 'package:flutter_app/src/pages/dashboard/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Crypt',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        drawer: getDrawer(controller.cerrarSesion),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titulo(),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              contenedor(),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              subTitulo(),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              cards(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget cards() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        GestureDetector(
          onTap: controller.goToClientes,
          child: itemGridView('Clientesss', Icons.people),
        ),
        itemGridView('Prestamos', Icons.monetization_on),
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
        itemGridView('Clientesss', Icons.ac_unit_outlined),
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

  Widget subTitulo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Your Currencies',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget contenedor() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          columnaContenedor('texto', '1000'),
          columnaContenedor('texto2', '2000'),
          columnaContenedor('texto3', '3000'),
        ],
      ),
    );
  }

  Widget columnaContenedor(String texto, String monto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        Text(
          monto,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget titulo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Your Dashboard',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 28,
        ),
      ),
    );
  }
}
