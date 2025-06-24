import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/payment_frequency_model.dart';
import 'package:flutter_app/src/ui/pages/payment_frequency/add_payment_frequency_page.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:get/get.dart';

class PaymentFrequencyController extends GetxController {
  List<PaymentFrequencyModel> frecuencias = [];
  bool validando = false;

  @override
  void onInit() async {
    getPaymentFrequency();
    super.onInit();
  }

  Future<void> goToAddPaymentFrequencyPage() async {
    PaymentFrequencyModel? result =
        await Get.to<PaymentFrequencyModel>(() => AddPaymentFrequencyPage());
    if (result != null) {
      frecuencias.add(result);
      update();
    }
  }

  void goEditar(int position) async {
    PaymentFrequencyModel selected = frecuencias[position];
    PaymentFrequencyModel? result = await Get.to<PaymentFrequencyModel>(
        () => AddPaymentFrequencyPage(),
        arguments: {
          'selected': selected,
        });

    if (result != null) {
      frecuencias[position] = result;
      update();
    }
  }

  void goEliminar(int position) async {
    bool? response = await showDialog<bool>(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('Alerta'),
        content: Text('Estás seguro de eliminar la frecuencia $position?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text('Si'),
          ),
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text('No'),
          ),
        ],
      ),
    );
    if (response == true) {
      _eliminarDelServidor(position);
      //conexion al servidor que eliminara en BD
      // si es exitoso, eliminar el elemento del listado y hacer update
    }
  }

  void _eliminarDelServidor(int position) async {
    AppHttpManager appHttpManager = AppHttpManager();
    validando = true;
    update(['validando']);
    PaymentFrequencyModel selected = frecuencias[position];
    AppResponse response =
        await appHttpManager.delete(path: '/customer/delete/${selected.id}');
    validando = false;
    update(['validando']);
    if (response.isSuccess) {
      frecuencias.removeAt(position);
      update();
    } else {
      Get.snackbar('error', 'Ocurrio un error');
    }
  }

  Future<void> getPaymentFrequency() async {
    AppHttpManager appHttpManager = AppHttpManager();
    validando = true;
    update(['validando']);
    AppResponse response =
        await appHttpManager.get(path: '/utils/payment-frequency');
    validando = false;
    update(['validando']);
    if (response.isSuccess) {
      frecuencias = paymentFrequencyModelFromJson(response.body);
      update();
    } else {
      Get.snackbar('Error', 'Ocurrio un error');
    }
  }
}
