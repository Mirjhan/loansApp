import 'package:flutter_app/src/ui/pages/payment_frequency/payment_frequency_page.dart';
import 'package:flutter_app/src/ui/pages/payment_method/payment_method_page.dart';
import 'package:flutter_app/src/ui/pages/usuarios/usuario_page.dart';
import 'package:get/get.dart';

class ConfiguracionController extends GetxController {
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
