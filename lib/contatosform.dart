import 'package:banco/contatos.dart';
import 'package:banco/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      //Pega as informações
                      final nome = _nomeController.text;
                      final numero = int.parse(_numeroController.text);
                      final Contact newContact = Contact(0, nome, numero);
                      //envia os dados para a página anterior
                      Get.back(result: newContact);
                    },
                    child: Text('Salvar')),
              ),
            )
  ], ),
      ),
    );
  }
}
