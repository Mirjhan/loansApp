import 'package:flutter_app/src/ui/pages/prestamos/add_prestamo_page.dart';
import 'package:get/get.dart';

class PrestamoController extends GetxController {
  void goToAddPrestamo() {
    Get.to(() => AddPrestamoPage());
  }
}
