import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/payment_frequency_model.dart';
import 'package:flutter_app/src/ui/pages/prestamos/add_prestamo_controller.dart';
import 'package:flutter_app/src/ui/widgets/input_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPrestamoPage extends StatelessWidget {
  AddPrestamoPage({super.key});
  final AddPrestamoController controller = AddPrestamoController();
  final TextEditingController startDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPrestamoController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Nuevo prestamo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: Column(
              children: [
                InputWidget(
                  hintText: 'idCliente',
                  iconData: Icons.person,
                  onChanged: controller.onChangedName,
                ),
                InputWidget(
                  hintText: 'idUsuario',
                  iconData: Icons.person_2,
                  onChanged: controller.onChangedName,
                ),
                DropdownButton<int>(
                    items: controller.frecuencias.map(getElements).toList(),
                    isExpanded: true,
                    value: controller.idPaymentFrequency,
                    onChanged: controller.onChangedIdPaymentFrequency),
                InputWidget(
                    hintText: 'amount',
                    iconData: Icons.monetization_on_outlined,
                    onChanged: controller.onChangedName),
                InputWidget(
                    hintText: 'percentage',
                    iconData: Icons.percent_rounded,
                    onChanged: controller.onChangedName),
                InputWidget(
                  onTap: () => _showDatePicker(context),
                  enabled: false,
                  hintText: 'start date',
                  iconData: Icons.date_range_outlined,
                  controller: startDateController,
                ),
                InputWidget(
                    hintText: 'ganancy',
                    iconData: Icons.monetization_on_sharp,
                    onChanged: controller.onChangedName),
                DropdownButton<int>(
                    hint: Text('Seleccione el metodo de pago'),
                    items: controller.metodos
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    value: controller.idPaymentMethod,
                    onChanged: controller.onChangedIdPaymentMethod),
                InputWidget(
                    hintText: 'observation',
                    iconData: Icons.edit_note,
                    onChanged: controller.onChangedName),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = now.subtract(Duration(days: 7));
    final DateTime lastDate = now.add(Duration(days: 7));

    DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null) {
      DateFormat dateFormat = DateFormat('EEEE dd/MMMM/yyy', 'es');
      startDateController.text = dateFormat.format(selectedDate);

      controller.onChangedStartDate(selectedDate);
    }
  }

  DropdownMenuItem<int> getElements(PaymentFrequencyModel e) =>
      DropdownMenuItem(value: e.id, child: Text(e.name));
}
