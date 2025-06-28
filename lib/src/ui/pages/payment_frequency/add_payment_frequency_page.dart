import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/pages/payment_frequency/add_payment_frequency_controller.dart';
import 'package:flutter_app/src/ui/widgets/input_widget.dart';
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
                InputWidget(
                  hintText: 'name',
                  iconData: Icons.abc,
                  keyboardType: TextInputType.name,
                  onChanged: controller.onChangedName,
                  initialValue: controller.frecuenciaSeleccionada?.name,
                ),
                InputWidget(
                  hintText: 'description',
                  iconData: Icons.abc,
                  keyboardType: TextInputType.text,
                  onChanged: controller.onChangedDescription,
                  initialValue: controller.frecuenciaSeleccionada?.description,
                ),
                InputWidget(
                  hintText: 'porcentaje recomendado',
                  iconData: Icons.percent,
                  keyboardType: TextInputType.number,
                  onChanged: controller.onChangedRecommendedPercentage,
                  initialValue: controller
                      .frecuenciaSeleccionada?.recommendedPercentage
                      .toString(),
                ),
                InputWidget(
                  hintText: 'cuotas mensuales',
                  iconData: Icons.numbers,
                  keyboardType: TextInputType.number,
                  onChanged: controller.onChangedMonthlyInstallments,
                  initialValue: controller
                      .frecuenciaSeleccionada?.monthlyInstallments
                      .toString(),
                ),
                InputWidget(
                  hintText: 'cuotas diarias',
                  iconData: Icons.numbers,
                  keyboardType: TextInputType.number,
                  onChanged: controller.onChangedDaysInstallment,
                  initialValue: controller
                      .frecuenciaSeleccionada?.daysInstallment
                      .toString(),
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
}
