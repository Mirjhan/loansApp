import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/pages/cliente/cliente_page.dart';
import 'package:flutter_app/src/ui/pages/configuracion/configuracion_page.dart';
import 'package:flutter_app/src/ui/pages/dashboard/content_controller.dart';
import 'package:flutter_app/src/ui/pages/inicio/inicio_page.dart';
import 'package:flutter_app/src/ui/pages/prestamos/prestamo_page.dart';
import 'package:get/get.dart';

class ContentPage extends StatelessWidget {
  ContentPage({super.key});
  final ContentController controller = ContentController();
  final List<Widget> pages = [
    InicioPage(),
    ClientePage(),
    PrestamoPage(),
    ConfiguracionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContentController>(
      init: controller,
      builder: (controller) => Scaffold(
        //drawer: getDrawer(controller.cerrarSesion),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.indexPage,
          onTap: controller.onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Clientes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Prestamos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Configuracion',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
