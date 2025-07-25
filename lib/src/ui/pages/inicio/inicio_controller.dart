import 'package:flutter_app/src/ui/pages/cliente/cliente_page.dart';
import 'package:flutter_app/src/ui/pages/login/login_page.dart';
import 'package:flutter_app/src/ui/pages/payment_frequency/payment_frequency_page.dart';
import 'package:flutter_app/src/ui/pages/payment_method/payment_method_page.dart';
import 'package:flutter_app/src/ui/pages/usuarios/usuario_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InicioController extends GetxController {
  void goToClientes() {
    Get.to(() => ClientePage());
  }

  void goToUsuarios() {
    Get.to(() => UsuarioPage());
  }

  void goToPaymentFrequency() {
    Get.to(() => PaymentFrequencyPage());
  }

  void goToPaymentMethod() {
    Get.to(() => PaymentMethodPage());
  }

  void cerrarSesion() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.off(() => LoginPage());
  }
}
