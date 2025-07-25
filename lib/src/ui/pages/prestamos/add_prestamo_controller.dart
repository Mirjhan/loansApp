import 'package:flutter_app/src/models/payment_frequency_model.dart';
import 'package:flutter_app/src/models/payment_method_model.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:get/get.dart';

class AddPrestamoController extends GetxController {
  List<PaymentMethodModel> metodos = [];
  List<PaymentFrequencyModel> frecuencias = [];

  int? idCliente;
  int? idUsuario;
  int? idPaymentFrequency;
  int? monto;
  double? porcentaje;
  DateTime? startDate;
  int? ganancia;
  int? idPaymentMethod;
  String observacion = "";
  int? idEstadoPrestamo;
  String evidencia = "";
  String name = "";

  @override
  void onInit() {
    getPaymentFrequency();
    getPaymentMethod();
    super.onInit();
  }

  void onChangedName(String value) {
    name = value;
  }

  void onChangedIdPaymentFrequency(int? value) {
    if (value == null) return;
    idPaymentFrequency = value;
    update();
  }

  void onChangedIdPaymentMethod(int? value) {
    if (value == null) return;
    idPaymentMethod = value;
    update();
  }

  Future<void> getPaymentMethod() async {
    AppHttpManager appHttpManager = AppHttpManager();
    AppResponse response =
        await appHttpManager.get(path: '/utils/payment-method');
    if (response.isSuccess) {
      metodos = paymentMethodModelFromJson(response.body);
      update();
    } else {
      Get.snackbar('error', 'Ocurrio un error');
    }
  }

  Future<void> getPaymentFrequency() async {
    AppHttpManager appHttpManager = AppHttpManager();
    AppResponse response =
        await appHttpManager.get(path: '/utils/payment-frequency');
    if (response.isSuccess) {
      frecuencias = paymentFrequencyModelFromJson(response.body);
      update();
    } else {
      Get.snackbar('error', 'Ocurrio un error');
    }
  }

  void onChangedStartDate(DateTime value) {
    startDate = value;
    update();
  }
}
