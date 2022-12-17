import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_cep_flutter/about.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
 
}

class _HomePageState extends State<HomePage> {
  TextEditingController valorController = TextEditingController();

  String resultado = "";

  fetch(String teste) async {
  var url = 'https://api.postmon.com.br/v1/cep/$teste';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  var todo = Todo.fromJson(json);
  setState(() {
    resultado = "${todo.cep}\n${todo.cidade}\n${todo.estado}";
  });
}


  //* Widgets //-----------------
  


  @override


  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 240, 94, 2),
        centerTitle: false,
        title: const Text(
          'Consultando um CEP via API',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        actions: <Widget>[
          IconButton(
            color: Color.fromARGB(255, 218, 106, 1),
            icon: const Icon(Icons.refresh),
            onPressed: () {
              valorController.clear();
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Digite o Cep desejado',
                hintStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () {
                  fetch(valorController.text);
                }, child: const Text('Buscar')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(resultado),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () {
                 Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => PaginaUno()));
                    
                }, child: const Text('About')),
          ),
        ],
        
      )),
    );
  }
}

class ValorController {
  final String? valorClasse;
  ValorController({this.valorClasse});
}

class Todo {
  final String? cidade;
  final String? estado;
  final String cep;

  Todo({this.cidade, this.estado, required this.cep});

  factory Todo.fromJson(Map json) {
    return Todo(
      cep: json['cep'],
      estado: json['estado'],
      cidade: json['cidade'],
    );
  }
}


