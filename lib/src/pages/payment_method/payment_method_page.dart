import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/payment_method/payment_method_controller.dart';
import 'package:get/get.dart';

class PaymentMethodPage extends StatelessWidget {
  PaymentMethodPage({super.key});

  final PaymentMethodController controller = PaymentMethodController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Metodo de Pago'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: controller.getPaymentMethod,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: controller.metodos.length,
                itemBuilder: (context, index) => itemListTile(
                    controller.metodos[index].name,
                    controller.metodos[index].description,
                    index),
              ),
            ),
            GetBuilder<PaymentMethodController>(
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
          onPressed: controller.goToAddPaymentMethodPage,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget itemListTile(String title, String subtitle, int position) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
          child: Icon(
            Icons.phone_android_outlined,
          ),
        ),
        title: Text(
          title,
        ),
        subtitle: Text(
          subtitle,
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
