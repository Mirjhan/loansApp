import 'package:flutter_app/src/data/requests/cliente_request.dart';
import 'package:flutter_app/src/models/cliente_model.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:get/get.dart';

class AddClienteController extends GetxController {
  ClienteModel? clienteSeleccionado;

  String name = "";
  String lastName = "";
  String address = "";
  String latitude = "";
  String longitude = "";
  int idTypeDocument = 1;
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
        idTypeDocument = clienteSeleccionado?.idTypeDocument ?? 1;
        document = clienteSeleccionado?.document ?? '';
      }
    }
    // consultar los tipos de documento
    // crear un metodo que se conecte al servidor y que traiga los utils/type-document
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

  void onChangedIdTypeDocument(String value) {
    int? convertido = int.tryParse(value);
    if (convertido != null) {
      idTypeDocument = convertido;
    }
  }

  void onChangedDocument(String value) {
    document = value;
  }

  Future<void> createCliente() async {
    String? mensaje = validar();
    if (mensaje != null) {
      showSnackbar(mensaje);
      return;
    } else {
      AppHttpManager appHttpManager = AppHttpManager();
      validando = true;
      update(['validando']);
      ClienteRequest clienteRequest = ClienteRequest(
        name: name,
        lastName: lastName,
        address: address,
        latitude: latitude,
        longitude: longitude,
        idTypeDocument: idTypeDocument,
        document: document,
      );
      AppResponse response = await appHttpManager.post(
          path: '/customer/create', body: clienteRequest.toJson());
      validando = false;
      update(['validando']);
      if (response.isSuccess) {
        ClienteModel clienteModel = addClienteModelFromJson(response.body);
        Get.back(result: clienteModel);
      } else {
        showSnackbar('Ocurrio un error con el servidor');
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
      ClienteRequest clienteRequest = ClienteRequest(
        id: clienteSeleccionado?.id,
        name: name,
        lastName: lastName,
        address: address,
        latitude: latitude,
        longitude: longitude,
        idTypeDocument: idTypeDocument,
        document: document,
      );

      AppResponse response = await appHttpManager.put(
        path: '/customer/update',
        body: clienteRequest.toJson(),
      );
      validando = false;
      update(['validando']);
      if (response.isSuccess) {
        ClienteModel clienteModel = addClienteModelFromJson(response.body);
        Get.back(result: clienteModel);
      } else {
        showSnackbar('Ocurrio un error con el servidor');
      }
    }
  }

  void showSnackbar(String message) {
    Get.snackbar('Error', message);
  }
}
