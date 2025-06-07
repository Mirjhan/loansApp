import 'dart:developer';
import 'package:flutter_app/src/models/payment_method_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddPaymentMethodController extends GetxController {
  PaymentMethodModel? metodoSeleccionado;

  String name = "";
  String description = "";
  bool validando = false;
  bool editando = false;

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments['selected'] != null) {
        metodoSeleccionado = Get.arguments['selected'];
        editando = true;
        name = metodoSeleccionado?.name ?? '';
        description = metodoSeleccionado?.description ?? '';
      }
    }
    super.onInit();
  }

  String? validar() {
    if (name.trim().isEmpty) return 'Este campo no debe ser vacio.';
    if (description.trim().isEmpty) return 'Este campo no debe ser vacio.';
    return null;
  }

  void onChangedName(String value) {
    name = value;
  }

  void onChangedDescription(String value) {
    description = value;
  }

  Future<void> send() async {
    String? mensaje = validar();
    if (mensaje != null) {
      showSnackbar(mensaje);
      return;
    } else {
      Uri url = Uri.http('10.0.2.2:3001', 'utils/payment-method/create');
      validando = true;
      update(['validando']);

      http.Response response = await http.post(url, body: {
        'name': name,
        'description': description,
      });
      validando = false;
      update(['validando']);

      log('Response status: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        PaymentMethodModel paymentMethod =
            addPaymentMethodModelFromJson(response.body);
        print(paymentMethod.name);
        Get.back(result: paymentMethod);
      } else {
        showSnackbar('Ocurrio un error con el servidor');
        log(response.body);
      }
    }
  }

  Future<void> edit() async {
    String? mensaje = validar();
    if (mensaje != null) {
      showSnackbar(mensaje);
      return;
    } else {
      Uri url = Uri.http('10.0.2.2:3001', 'utils/payment-method/update');
      validando = true;
      update(['validando']);

      http.Response response = await http.put(url, body: {
        'id': metodoSeleccionado?.id.toString(),
        'name': name,
        'description': description,
      });
      validando = false;
      update(['validando']);

      log('Response status: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        PaymentMethodModel paymentFrequency =
            addPaymentMethodModelFromJson(response.body);
        Get.back(result: paymentFrequency);
      } else {
        showSnackbar('Ocurrio un error con el servidor');
        log(response.body);
      }
    }
  }

  void showSnackbar(String message) {
    Get.snackbar('Error', message);
  }
}
