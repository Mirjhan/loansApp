import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/cliente_model.dart';
import 'package:flutter_app/src/ui/pages/cliente/add_cliente_page.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:get/get.dart';

class ClienteController extends GetxController {
  List<ClienteModel> clientes = [];
  bool validando = false;

  @override
  void onReady() async {
    getClientes();
    super.onReady();
  }

  Future<void> getClientes() async {
    AppHttpManager appHttpManager = AppHttpManager();
    validando = true;
    update(['validando']);
    AppResponse response = await appHttpManager.get(path: '/customer');
    validando = false;
    update(['validando']);
    if (response.isSuccess) {
      clientes = clienteModelFromJson(response.body);
      update();
    } else {
      Get.snackbar('Error', 'Ocurrio un error');
    }
  }

  void goEditar(int position) async {
    ClienteModel selected = clientes[position];
    ClienteModel? result =
        await Get.to<ClienteModel>(() => AddClientePage(), arguments: {
      'selected': selected,
    });

    if (result != null) {
      clientes[position] = result;
      Get.snackbar(
        'Exito',
        'Cliente editado',
        backgroundColor: Colors.green,
      );
      update();
    }
  }

  void goEliminar(int position) async {
    bool? response = await showDialog<bool>(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('Alerta'),
        content: Text('Estqas seguro de eliminar el cliente $position?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text('Si'),
          ),
        ],
      ),
    );
    if (response == true) {
      _eliminarDelServidor(position);
    }
  }

  //http://10.0.2.2:3001/customer/delete/2
//http://10.0.2.2:3001/customer/delete?id=2&
  void _eliminarDelServidor(int position) async {
    AppHttpManager appHttpManager = AppHttpManager();
    validando = true;
    update(['validando']);
    ClienteModel selected = clientes[position];
    AppResponse response =
        await appHttpManager.delete(path: '/customer/delete/${selected.id}');
    validando = false;
    update(['validando']);
    if (response.isSuccess) {
      clientes.removeAt(position);
      update();
    } else {
      Get.snackbar('error', 'Ocurrio un error');
    }
  }

  Future<void> goToAddClientePage() async {
    ClienteModel? result = await Get.to<ClienteModel>(() => AddClientePage());
    if (result != null) {
      clientes.add(result);
      Get.snackbar('Exito', 'Cliente agregado');
      update();
    }
  }
}
