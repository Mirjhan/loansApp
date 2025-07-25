import 'package:flutter_app/src/data/requests/login_request.dart';
import 'package:flutter_app/src/models/user_model.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:flutter_app/src/ui/pages/dashboard/content_page.dart';
import 'package:flutter_app/src/ui/pages/sign_up/sign_up_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  String email = "";
  String password = "";
  bool validando = false;

  @override
  void onInit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool('estaLogeado') ?? false) {
      Get.off(() => ContentPage());
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
    AppHttpManager appHttpManager = AppHttpManager();
    validando = true;
    update(['validando']);
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    AppResponse response = await appHttpManager.post(
        path: '/auth/login', body: loginRequest.toJson());
    validando = false;
    update(['validando']);
    if (response.isSuccess) {
      userModelFromJson(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('estaLogeado', true);
      Get.off(() => ContentPage());
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
