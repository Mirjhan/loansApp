import 'dart:developer';
import 'package:flutter_app/src/models/user_model.dart';
import 'package:flutter_app/src/pages/dashboard/home_page.dart';
import 'package:flutter_app/src/pages/sign_up/sign_up_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  String email = "";
  String password = "";
  bool validando = false;

  @override
  void onInit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool('estaLogeado') ?? false) {
      Get.off(() => HomePage());
    }
    super.onInit();
  }

  String? validar() {
    if (email.trim().isEmpty) return 'Email no debe ser vacio.';
    if (password.trim().isEmpty) return 'Password no debe ser vacio.';
    return null;
  }

  Future<void> enviarServidor() async {
    String? mensaje = validar();
    if (mensaje != null) {
      showSnackbar(mensaje);
      return;
    }

    Uri url = Uri.http('10.0.2.2:3001', 'auth/login');
    validando = true;
    update(['validando']);

    http.Response response =
        await http.post(url, body: {'email': email, 'password': password});
    validando = false;
    update(['validando']);

    log('Response status: ${response.statusCode}');
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      UserModel userModel = userModelFromJson(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('estaLogeado', true);
      Get.off(() => HomePage());

      print(userModel.name);
    } else {
      showSnackbar('Ocurrio un error con el servidor');
    }
  }

  void goToSignUp() {
    Get.to(() => SignUpPage());
  }

  void showSnackbar(String message) {
    Get.snackbar('Error', message);
  }
}
