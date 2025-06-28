import 'package:flutter_app/src/data/requests/payment_method_request.dart';
import 'package:flutter_app/src/models/payment_method_model.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:get/get.dart';

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
      AppHttpManager appHttpManager = AppHttpManager();
      validando = true;
      update(['validando']);
      PaymentMethodRequest paymentMethodRequest = PaymentMethodRequest(
        name: name,
        description: description,
      );
      AppResponse response = await appHttpManager.post(
          path: '/utils/payment-method/create',
          body: paymentMethodRequest.toJson());
      validando = false;
      update(['validando']);
      if (response.isSuccess) {
        PaymentMethodModel paymentMethodModel =
            addPaymentMethodModelFromJson(response.body);
        Get.back(result: paymentMethodModel);
      } else {
        showSnackbar('Ocurrio un error en el servidor');
      }

      ///
      /*http.Response response = await http.post(url, body: {
        'name': name,
        'description': description,
      });*/
    }
  }

  Future<void> edit() async {
    String? mensaje = validar();
    if (mensaje != null) {
      showSnackbar(mensaje);
      return;
    } else {
      AppHttpManager appHttpManager = AppHttpManager();
      validando = true;
      update(['validando']);
      PaymentMethodRequest paymentMethodRequest = PaymentMethodRequest(
        id: metodoSeleccionado?.id,
        name: name,
        description: description,
      );
      AppResponse response = await appHttpManager.put(
          path: '/utils/payment-method/update',
          body: paymentMethodRequest.toJson());
      validando = false;
      update(['validando']);
      if (response.isSuccess) {
        PaymentMethodModel paymentMethod =
            addPaymentMethodModelFromJson(response.body);
        Get.back(result: paymentMethod);
      } else {
        showSnackbar('Ocurrio un error con el servidor');
      }
    }
  }

  void showSnackbar(String message) {
    Get.snackbar('Error', message);
  }
}
