import 'package:banco/contatos.dart';
import 'package:banco/contatosform.dart';
import 'package:banco/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const Banco());
}

class Banco extends StatelessWidget {
  const Banco({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          appBarTheme: AppBarTheme(color: Colors.green[900]),
            ),
      home: Dashboard(),
    );
  }
}



