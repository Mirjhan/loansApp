import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/payment_frequency/payment_frequency_controller.dart';
import 'package:get/get.dart';

class PaymentFrequencyPage extends StatelessWidget {
  PaymentFrequencyPage({super.key});

  final PaymentFrequencyController controller = PaymentFrequencyController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentFrequencyController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Frecuencia de Pagos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: controller.getPaymentFrequency,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: controller.frecuencias.length,
                itemBuilder: (context, index) => itemListTile(
                    '${controller.frecuencias[index].recommendedPercentage.toString()}%',
                    controller.frecuencias[index].name,
                    controller.frecuencias[index].description,
                    index),
              ),
            ),
            GetBuilder<PaymentFrequencyController>(
              id: 'validando',
              builder: (controller) => controller.validando
                  ? Container(
                      alignment: Alignment.center,
                      color: Colors.black45,
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.goToAddPaymentFrequencyPage,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget itemListTile(
      String porcentaje, String title, String subtitle, int position) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ListTile(
        leading: CircleAvatar(
            radius: 40,
            child: Text(
              porcentaje,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            )),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: SizedBox(
          width: 96,
          child: Row(
            children: [
              IconButton(
                  onPressed: () => controller.goEditar(position),
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () => controller.goEliminar(position),
                  icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
