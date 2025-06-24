import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/payment_frequency/add_payment_frequency_controller.dart';
import 'package:get/get.dart';

class AddPaymentFrequencyPage extends StatelessWidget {
  AddPaymentFrequencyPage({super.key});
  final AddPaymentFrequencyController controller =
      AddPaymentFrequencyController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPaymentFrequencyController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.editando
                ? 'Editando Frecuencia de Pago'
                : 'Nueva Frecuencia de Pago',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                inputWidget(
                  'name',
                  Icons.abc,
                  TextInputType.name,
                  controller.onChangedName,
                  controller.frecuenciaSeleccionada?.name,
                ),
                inputWidget(
                  'description',
                  Icons.abc,
                  TextInputType.text,
                  controller.onChangedDescription,
                  controller.frecuenciaSeleccionada?.description,
                ),
                inputWidget(
                  'porcentaje recomendado',
                  Icons.percent,
                  TextInputType.number,
                  controller.onChangedRecommendedPercentage,
                  controller.frecuenciaSeleccionada?.recommendedPercentage
                      .toString(),
                ),
                inputWidget(
                  'cuotas mensuales',
                  Icons.numbers,
                  TextInputType.number,
                  controller.onChangedMonthlyInstallments,
                  controller.frecuenciaSeleccionada?.monthlyInstallments
                      .toString(),
                ),
                inputWidget(
                  'cuotas diarias',
                  Icons.numbers,
                  TextInputType.number,
                  controller.onChangedDaysInstallment,
                  controller.frecuenciaSeleccionada?.daysInstallment.toString(),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: controller.editando
              ? controller.edit
              : controller.createPaymentFrequency,
          child: Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 30, left: 30),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Text(
              controller.editando ? 'Guardar' : 'Agregar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputWidget(String hintText, IconData icon, TextInputType keyboardType,
      void Function(String)? onChanged, String? initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: Colors.redAccent,
          ),
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
