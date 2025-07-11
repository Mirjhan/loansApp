import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/pages/sign_up/sign_up_controller.dart';
import 'package:flutter_app/src/ui/widgets/input_widget.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController controller = SignUpController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GetBuilder<SignUpController>(
      init: controller,
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    children: [
                      titulo(),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      cajasDeTexto(),
                      botonSignUp(),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<SignUpController>(
              id: 'validando',
              builder: (controller) => controller.validando
                  ? Container(
                      alignment: Alignment.center,
                      color: Colors.black45,
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget titulo() {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(
          left: 40,
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 35,
          ),
        ),
      ),
    );
  }

  Widget cajasDeTexto() {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        child: Column(
          children: [
            InputWidget(
              hintText: 'email',
              iconData: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              onChanged: controller.onChangedEmail,
            ),
            InputWidget(
              hintText: 'password',
              iconData: Icons.lock_outline_rounded,
              keyboardType: TextInputType.number,
              onChanged: controller.onChangedPassword,
            ),
            InputWidget(
              hintText: 'firstName',
              iconData: Icons.person_2_outlined,
              onChanged: controller.onChangedFirstName,
            ),
            InputWidget(
              hintText: 'lastName',
              iconData: Icons.person_3_outlined,
              keyboardType: TextInputType.name,
              onChanged: controller.onChangedLastName,
            ),
            InputWidget(
              hintText: 'phoneNumber',
              iconData: Icons.phone_enabled_outlined,
              keyboardType: TextInputType.number,
              onChanged: controller.onChangedPhoneNumber,
            ),
            //SOLID -> SINGLE RESPONSABILITY
            // CADA COSA TIENE SU REPONSABILIDAD
            // PAGE -> UI SOLO TIENEN LA INTERFAZ
            // CONTROLLER -> DATOS DE LA LOGICA, CONSULTAN
            // CADA METODO TIENE QUE HACER UNA COSA.
          ],
        ),
      ),
    );
  }

  Widget botonSignUp() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: GestureDetector(
          onTap: controller.send,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.only(top: 8, bottom: 8, right: 30, left: 30),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
