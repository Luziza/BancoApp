import 'package:banco/contatosform.dart';
import 'package:banco/database/app_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/contact.dart';

class Contatos extends StatelessWidget {
  Contatos({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contatos'),),
      body: FutureBuilder<List<Contact>>(
        future: findAll(),
        builder: (context, snapshot){
          //lista de contatos
          //Explicação do snapshot.data no arquivo de anotações
          switch(snapshot.connectionState){
            case ConnectionState.none:
              print("aa");
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              print('ativo');
              break;
            case ConnectionState.done:
              final List<Contact> contacts = (snapshot.data as List<Contact>);
              return ListView.builder(
                itemBuilder: (context, index){
                  final Contact contact = contacts[index];
                  return CardContacts(contact);
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text('Erro desconhecido');


        },

      ),
      

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(ContactsForm())!.then((result){
            if (result != null) {
              // Aqui você pode lidar com o resultado, como por exemplo:
              print('O novo contato é: $result');
            }});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CardContacts extends StatelessWidget {

  final Contact contact;
  CardContacts(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(contact.nome, style: TextStyle(fontSize: 25),),
          subtitle: Text(contact.numero.toString(), style: TextStyle(fontSize: 15)),
      ),
    );
  }
}

