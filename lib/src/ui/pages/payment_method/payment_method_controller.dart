import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/payment_method_model.dart';
import 'package:flutter_app/src/ui/pages/payment_method/add_payment_method_page.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  List<PaymentMethodModel> metodos = [];
  bool validando = false;

  @override
  void onInit() async {
    getPaymentMethod();
    super.onInit();
  }

  Future<void> goToAddPaymentMethodPage() async {
    PaymentMethodModel? result =
        await Get.to<PaymentMethodModel>(() => AddPaymentMethodPage());
    if (result != null) {
      metodos.add(result);
      update();
    }
  }

  Future<void> getPaymentMethod() async {
    AppHttpManager appHttpManager = AppHttpManager();
    validando = true;
    update(['validando']);
    AppResponse response =
        await appHttpManager.get(path: '/utils/payment-method');
    validando = false;
    update(['validando']);
    if (response.isSuccess) {
      metodos = paymentMethodModelFromJson(response.body);
      update();
    } else {
      Get.snackbar('error', 'Ocurrio un error');
    }
  }

  void goEditar(int position) async {
    PaymentMethodModel selected = metodos[position];
    PaymentMethodModel? result = await Get.to<PaymentMethodModel>(
        () => AddPaymentMethodPage(),
        arguments: {
          'selected': selected,
        });
    if (result != null) {
      metodos[position] = result;
      update();
    }
  }

  void goEliminar(int position) async {
    bool? response = await showDialog<bool>(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('Alerta'),
        content: Text('Estás seguro de eliminar el metodo $position?'),
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
    PaymentMethodModel selected = metodos[position];
    AppResponse response = await appHttpManager.delete(
        path: '/utils/payment-method/delete/${selected.id}');
    validando = false;
    update(['validando']);
    if (response.isSuccess) {
      metodos.removeAt(position);
      update();
    } else {
      Get.snackbar('error', 'Ocurrio un error');
    }
  }
}
