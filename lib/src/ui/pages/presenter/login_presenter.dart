import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginPresenter {
  String email = "";
  String password = "";
  bool validando = false;

  String? validar() {
    if (email.trim().isEmpty) return 'Email no debe ser vacio.';
    if (password.trim().isEmpty) return 'Password no debe ser vacio.';
    return null;
  }

  void enviarServidor(BuildContext context) async {
    String? mensaje = validar();
    if (mensaje != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mensaje)));
      return;
    }

    Uri url = Uri.https('4a75-190-236-246-186.ngrok-free.app', 'auth/login');
    validando = true;

    http.Response response =
        await http.post(url, body: {'email': email, 'password': password});
    validando = false;

    log('Response status: ${response.statusCode}');
  }
}
