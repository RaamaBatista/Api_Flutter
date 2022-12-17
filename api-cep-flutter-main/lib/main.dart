import 'package:api_cep_flutter/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Flutter API',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:   HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
