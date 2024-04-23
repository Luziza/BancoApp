import 'package:banco/contatosform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Contatos extends StatelessWidget {
  const Contatos({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contatos'),),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Luiza', style: TextStyle(fontSize: 25),),
              subtitle: Text("234354564", style: TextStyle(fontSize: 15)),
            ),
          )
        ],
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
