import 'dart:developer';

import 'package:flutter_app/src/models/cliente_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddClienteController extends GetxController {
  ClienteModel? clienteSeleccionado;

  String name = "";
  String lastName = "";
  String address = "";
  String latitude = "";
  String longitude = "";
  String document = "";
  bool validando = false;
  bool editando = false;

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments['selected'] != null) {
        clienteSeleccionado = Get.arguments['selected'];
        editando = true;
        name = clienteSeleccionado?.name ?? '';
        lastName = clienteSeleccionado?.lastName ?? '';
        address = clienteSeleccionado?.address ?? '';
        latitude = clienteSeleccionado?.latitude ?? '';
        longitude = clienteSeleccionado?.longitude ?? '';
        document = clienteSeleccionado?.document ?? '';
      }
    }
    super.onInit();
  }

  String? validar() {
    if (name.isEmpty) return 'Este campo no debe ser vacio.';
    if (lastName.isEmpty) return 'Este campo no debe ser vacio.';
    if (address.isEmpty) return 'Este campo no debe ser vacio.';
    if (document.isEmpty) return 'Este campo no debe ser vacio.';
    return null;
  }

  void onChangedName(String value) {
    name = value;
  }

  void onChangedLastName(String value) {
    lastName = value;
  }

  void onChangedAddress(String value) {
    address = value;
  }

  void onChangedLatitude(String value) {
    latitude = value;
  }

  void onChangedLongitude(String value) {
    longitude = value;
  }

  void onChangedDocument(String value) {
    document = value;
  }

  Future<void> send() async {
    String? mensaje = validar();
    if (mensaje != null) {
      showSnackbar(mensaje);
      return;
    } else {
      Uri url = Uri.http('10.0.2.2:3001', 'customer/create');
      validando = true;
      update(['validando']);

      http.Response response = await http.post(url, body: {
        'name': name,
        'lastName': lastName,
        'address': address,
        'longitude': longitude,
        'latitude': latitude,
        'document': document,
      });
      validando = false;
      update(['validando']);

      log('Response status: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        ClienteModel cliente = addClienteModelFromJson(response.body);
        print(cliente.name);
        Get.back(result: cliente);
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
      Uri url = Uri.http('10.0.2.2:3001', 'customer/update');
      validando = true;
      update(['validando']);

      http.Response response = await http.put(url, body: {
        'id': clienteSeleccionado?.id.toString(),
        'name': name,
        'lastName': lastName,
        'address': address,
        'longitude': longitude,
        'latitude': latitude,
        'document': document,
      });
      validando = false;
      update(['validando']);

      log('Response status: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        if (response.statusCode >= 200 && response.statusCode <= 299) {
          ClienteModel cliente = addClienteModelFromJson(response.body);
          print(cliente.name);
          Get.back(result: cliente);
        } else {
          showSnackbar('Ocurrio un error con el servidor');
          log(response.body);
        }
      }
    }
  }

  void showSnackbar(String message) {
    Get.snackbar('Error', message);
  }
}
