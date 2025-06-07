import 'package:flutter/material.dart';

class PrestamosPage extends StatelessWidget {
  const PrestamosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buscar cliente',
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ingrese el nombre del cliente: ',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
