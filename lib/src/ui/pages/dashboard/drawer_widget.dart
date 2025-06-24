import 'package:flutter/material.dart';

Widget getDrawer(
  void Function()? cerrarSesion,
) {
  return Drawer(
    child: SafeArea(
      child: GestureDetector(
        onTap: cerrarSesion,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Cerrar Sesion',
          ),
        ),
      ),
    ),
  );
}
