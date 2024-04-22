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
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
