import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginStatefullPage2 extends StatefulWidget {
  const LoginStatefullPage2({super.key});

  @override
  State<LoginStatefullPage2> createState() => _LoginStatefullPage2State();
}

class _LoginStatefullPage2State extends State<LoginStatefullPage2> {
  String email = "";
  String password = "";
  bool validando = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: titulo(),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    Expanded(
                      flex: 3,
                      child: cajasDeTexto(),
                    ),
                    Expanded(
                      flex: 1,
                      child: forgotPass(),
                    ),
                    buttonLogin(),
                    Expanded(
                      flex: 3,
                      child: signUp(),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (validando)
            Container(
              alignment: Alignment.center,
              color: Colors.black45,
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  String? validar() {
    if (email.trim().isEmpty) return 'Email no debe ser vacio.';
    if (password.trim().isEmpty) return 'Password no debe ser vacio.';
    return null;
  }

  void enviarServidor() async {
    String? mensaje = validar();
    if (mensaje != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mensaje)));
      return;
    }

    Uri url = Uri.https('4a75-190-236-246-186.ngrok-free.app', 'auth/login');
    validando = true;
    setState(() {});
    http.Response response =
        await http.post(url, body: {'email': email, 'password': password});
    validando = false;
    setState(() {});

    log('Response status: ${response.statusCode}');
  }

  Widget buttonLogin() {
    return GestureDetector(
      onTap: enviarServidor,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 128,
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont have an account?',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'SIGN UP',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget forgotPass() {
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.only(
        right: 40,
      ),
      child: Text(
        'Forgot Password?',
      ),
    );
  }

  Widget cajasDeTexto() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 40,
      ),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              hintText: 'yourg55@gmail.com',
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          TextFormField(
            onChanged: (value) {
              password = value;
            },
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline_rounded),
              hintText: 'Password',
            ),
          ),
        ],
      ),
    );
  }

  Widget titulo() {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(
        left: 40,
      ),
      child: Text(
        'Login',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 35,
        ),
      ),
    );
  }
}
