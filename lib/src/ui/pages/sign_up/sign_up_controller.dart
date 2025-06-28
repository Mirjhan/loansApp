import 'package:flutter_app/src/data/requests/sign_up_request.dart';
import 'package:flutter_app/src/models/user_model.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:get/get.dart';

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
      AppHttpManager appHttpManager = AppHttpManager();
      validando = true;
      update(['validando']);
      SignUpRequest signUpRequest = SignUpRequest(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber);

      AppResponse response = await appHttpManager.post(
        path: '/user/create',
        body: signUpRequest.toJson(),
      );
      validando = false;
      update(['validando']);
      if (response.isSuccess) {
        userModelFromJson(response.body);
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
