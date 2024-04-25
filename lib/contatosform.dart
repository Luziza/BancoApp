import 'package:banco/contatos.dart';
import 'package:banco/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'database/app_database.dart';

class ContactsForm extends StatefulWidget {
  const ContactsForm({super.key});

  @override
  State<ContactsForm> createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {

    //Controller -> controla o texto que está sendo escrito no form
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo contato'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: "Nome completo",
              ),
              style: TextStyle(fontSize: 20),
            ),
        TextFormField(
          controller: _numeroController,
          decoration: InputDecoration(
            labelText: "Telefone",
          ),
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.number,
        ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.infinity,
                child:
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor
                    ),
                    onPressed: () {
                      //Pega as informações dos controllers
                      final nome = _nomeController.text;
                      final numero = int.parse(_numeroController.text);
                      //cria um novo contato
                      final Contact newContact = Contact(0, nome, numero);
                      // Ela retorna um Future que, quando concluído, retorna o id do contato salvo.
                      // O método then() é utilizado para executar uma ação após a conclusão do Future,
                      // que no caso é a navegação de volta para a lista de contatos
                      Save(newContact).then( (id) => Get.back());

                    },
                    child: Text('Salvar')),
              ),
            )
  ], ),
      ),
    );
  }
}
