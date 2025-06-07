import 'package:flutter_app/src/models/user_model.dart';
import 'package:flutter_app/src/services/app_http_manager.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart' as http;

class UsuarioController extends GetxController {
  List<UserModel> usuarios = [];
  bool validando = false;

  @override
  void onInit() async {
    getUsuarios();
    super.onInit();
  }

  Future<void> getUsuarios() async {
    AppHttpManager appHttpManager = AppHttpManager();
    validando = true;
    update(['validando']);
    AppResponse response = await appHttpManager.get(path: '/user');
    validando = false;
    update(['validando']);
    if (response.isSuccess) {
      usuarios = listUserModelFromJson(response.body);
      update();
    } else {
      Get.snackbar('errorr', 'Ocurrio un error');
    }
  }
}
