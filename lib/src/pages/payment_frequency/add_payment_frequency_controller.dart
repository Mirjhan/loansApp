import 'dart:developer';
import 'package:flutter_app/src/models/payment_frequency_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddPaymentFrequencyController extends GetxController {
  PaymentFrequencyModel? frecuenciaSeleccionada;

  String name = "";
  String description = "";
  String recommendedPercentage = "";
  String monthlyInstallments = "";
  String daysInstallment = "";
  bool validando = false;
  bool editando = false;

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments['selected'] != null) {
        frecuenciaSeleccionada = Get.arguments['selected'];
        editando = true;
        name = frecuenciaSeleccionada?.name ?? '';
        description = frecuenciaSeleccionada?.description ?? '';
        recommendedPercentage =
            frecuenciaSeleccionada?.recommendedPercentage.toString() ?? '';
        monthlyInstallments =
            frecuenciaSeleccionada?.monthlyInstallments.toString() ?? '';
        daysInstallment =
            frecuenciaSeleccionada?.daysInstallment.toString() ?? '';
      }
    }
    super.onInit();
  }

  String? validar() {
    if (name.trim().isEmpty) return 'Este campo no debe ser vacio.';
    if (description.trim().isEmpty) return 'Este campo no debe ser vacio.';
    if (recommendedPercentage.trim().isEmpty)
      return 'Este campo no debe ser vacio.';
    if (monthlyInstallments.trim().isEmpty)
      return 'Este campo no debe ser vacio.';
    if (daysInstallment.trim().isEmpty) return 'PhoneNumber no debe ser vacio.';
    return null;
  }

  void onChangedName(String value) {
    name = value;
  }

  void onChangedDescription(String value) {
    description = value;
  }

  void onChangedRecommendedPercentage(String value) {
    recommendedPercentage = value;
  }

  void onChangedMonthlyInstallments(String value) {
    monthlyInstallments = value;
  }

  void onChangedDaysInstallment(String value) {
    daysInstallment = value;
  }

  Future<void> send() async {
    String? mensaje = validar();
    if (mensaje != null) {
      showSnackbar(mensaje);
      return;
    } else {
      Uri url = Uri.http('10.0.2.2:3001', 'utils/payment-frequency/create');
      validando = true;
      update(['validando']);

      http.Response response = await http.post(url, body: {
        'name': name,
        'description': description,
        'recommended_percentage': recommendedPercentage,
        'monthly_installments': monthlyInstallments,
        'days_installment': daysInstallment,
      });
      validando = false;
      update(['validando']);

      log('Response status: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        PaymentFrequencyModel paymentFrequency =
            addPaymentFrequencyModelFromJson(response.body);
        print(paymentFrequency.name);
        Get.back(result: paymentFrequency);
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
      Uri url = Uri.http('10.0.2.2:3001', 'utils/payment-frequency/update');
      validando = true;
      update(['validando']);

      http.Response response = await http.put(url, body: {
        'id': frecuenciaSeleccionada?.id.toString(),
        'name': name,
        'description': description,
        'recommended_percentage': recommendedPercentage,
        'monthly_installments': monthlyInstallments,
        'days_installment': daysInstallment,
      });
      validando = false;
      update(['validando']);

      log('Response status: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        PaymentFrequencyModel paymentFrequency =
            addPaymentFrequencyModelFromJson(response.body);
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
