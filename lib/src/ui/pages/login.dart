import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
                  flex: 2,
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
    );
  }

  Widget buttonLogin() {
    return Container(
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
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              hintText: 'yourg55@gmail.com',
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          TextFormField(
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
