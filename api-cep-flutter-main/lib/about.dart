import 'package:flutter/material.dart';
import 'package:api_cep_flutter/api.dart';

class PaginaUno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
        backgroundColor: Color.fromARGB(255, 173, 88, 45),
      ),
      body: Container(
        child: Center(
          child: Text("Componentes: Gabriel Malheiros; Raama Batista"),
        ),
      ),
    );
  }
}
