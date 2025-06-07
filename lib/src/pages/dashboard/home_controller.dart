import 'package:flutter_app/src/pages/cliente/cliente_page.dart';
import 'package:flutter_app/src/pages/login/login_page.dart';
import 'package:flutter_app/src/pages/payment_frequency/payment_frequency_page.dart';
import 'package:flutter_app/src/pages/payment_method/payment_method_page.dart';
import 'package:flutter_app/src/pages/usuarios/usuario_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  void cerrarSesion() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.off(() => LoginPage());
  }

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
}
