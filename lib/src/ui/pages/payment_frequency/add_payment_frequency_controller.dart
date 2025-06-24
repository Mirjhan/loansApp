import 'package:flutter_app/src/data/requests/payment_frequency_request.dart';
import 'package:flutter_app/src/models/payment_frequency_model.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:get/get.dart';

class AddPaymentFrequencyController extends GetxController {
  PaymentFrequencyModel? frecuenciaSeleccionada;

  String name = "";
  String description = "";
  int recommendedPercentage = 0;
  int monthlyInstallments = 0;
  int daysInstallment = 0;
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
            frecuenciaSeleccionada?.recommendedPercentage ?? 1;
        monthlyInstallments = frecuenciaSeleccionada?.monthlyInstallments ?? 1;
        daysInstallment = frecuenciaSeleccionada?.daysInstallment ?? 1;
      }
    }
    super.onInit();
  }

  String? validar() {
    if (name.trim().isEmpty) return 'Este campo no debe ser vacio.';
    if (description.trim().isEmpty) return 'Este campo no debe ser vacio.';
    //if (recommendedPercentage.trim().isEmpty) {return 'Este campo no debe ser vacio.';}
    //if (monthlyInstallments.trim().isEmpty) {return 'Este campo no debe ser vacio.';}
    //if (daysInstallment.trim().isEmpty) return 'Este campo no debe ser vacio.';
    return null;
  }

  void onChangedName(String value) {
    name = value;
  }

  void onChangedDescription(String value) {
    description = value;
  }

  void onChangedRecommendedPercentage(String value) {
    int? convertido = int.tryParse(value);
    if (convertido != null) {
      recommendedPercentage = convertido;
    }
  }

  void onChangedMonthlyInstallments(String value) {
    int? convertido = int.tryParse(value);
    if (convertido != null) {
      monthlyInstallments = convertido;
    }
  }

  void onChangedDaysInstallment(String value) {
    int? convertido = int.tryParse(value);
    if (convertido != null) {
      daysInstallment = convertido;
    }
  }

  Future<void> createPaymentFrequency() async {
    String? mensaje = validar();
    if (mensaje != null) {
      showSnackbar(mensaje);
      return;
    } else {
      AppHttpManager appHttpManager = AppHttpManager();
      validando = true;
      update(['validando']);
      PaymentFrequencyRequest paymentFrequencyRequest = PaymentFrequencyRequest(
        name: name,
        description: description,
        recommendedPercentage: recommendedPercentage,
        monthlyInstallments: monthlyInstallments,
        daysInstallment: daysInstallment,
      );
      AppResponse response = await appHttpManager.post(
          path: '/utils/payment-frequency/create',
          body: paymentFrequencyRequest.toJson());
      validando = false;
      update(['validando']);

      if (response.isSuccess) {
        PaymentFrequencyModel paymentFrequencyModel =
            addPaymentFrequencyModelFromJson(response.body);
        Get.back(result: paymentFrequencyModel);
      } else {
        showSnackbar('Ocurrio un error en el servidor');
      }
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
      PaymentFrequencyRequest paymentFrequencyRequest = PaymentFrequencyRequest(
        id: frecuenciaSeleccionada?.id,
        name: name,
        description: description,
        recommendedPercentage: recommendedPercentage,
        monthlyInstallments: monthlyInstallments,
        daysInstallment: daysInstallment,
      );
      AppResponse response = await appHttpManager.put(
        path: '/utils/payment-frequency/update',
        body: paymentFrequencyRequest.toJson(),
      );
      validando = false;
      update(['validando']);
      if (response.isSuccess) {
        PaymentFrequencyModel paymentFrequencyModel =
            addPaymentFrequencyModelFromJson(response.body);
        Get.back(result: paymentFrequencyModel);
      } else {
        showSnackbar('Ocurrio un error en el servidor');
      }
    }
  }

  void showSnackbar(String message) {
    Get.snackbar('Error', message);
  }
}
