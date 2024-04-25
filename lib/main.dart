import 'package:banco/contatos.dart';
import 'package:banco/contatosform.dart';
import 'package:banco/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'database/app_database.dart';
import 'models/contact.dart';


void main() {
  runApp(const Banco());
  Save(Contact(1, 'iza', 2222)).then((id){
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
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



