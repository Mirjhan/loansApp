import 'dart:developer';
import 'package:flutter_app/src/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  String email = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  bool validando = false;

  String? validar() {
    if (email.trim().isEmpty) return 'Este campo no debe ser vacio.';
    if (password.trim().isEmpty) return 'Este campo no debe ser vacio.';
    if (firstName.trim().isEmpty) return 'Este campo no debe ser vacio.';
    if (lastName.trim().isEmpty) return 'Este campo no debe ser vacio.';
    if (phoneNumber.trim().isEmpty) return 'PhoneNumber no debe ser vacio.';
    return null;
  }

  void onChangedEmail(String value) {
    email = value;
  }

  void onChangedPassword(String value) {
    password = value;
  }

  void onChangedFirstName(String value) {
    firstName = value;
  }

  void onChangedLastName(String value) {
    lastName = value;
  }

  void onChangedPhoneNumber(String value) {
    phoneNumber = value;
    //validamos algo
    // oculta o muestra algo.

    //hace cualquier cosa
  }

  Future<void> send() async {
    String? mensaje = validar();
    if (mensaje != null) {
      showSnackbar(mensaje);
      return;
    } else {
      Uri url = Uri.https('10.0.2.2:3001', 'user/create');
      validando = true;
      update(['validando']);

      http.Response response = await http.post(url, body: {
        'email': email,
        'password': password,
        'name': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
      });
      validando = false;
      update(['validando']);

      log('Response status: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        UserModel userModel = userModelFromJson(response.body);
      } else {
        showSnackbar('Ocurrio un error con el servidor');
      }
    }

    //Ejecutamos el metodo validar
    //Si validar trae un error mostramos un mensaje snackbar al usuario
    //caso contrario enviamos la informacion al servidor
  }

  void showSnackbar(String message) {
    Get.snackbar('Error', message);
  }
}
