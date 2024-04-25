import 'package:banco/contatos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("imagens/bytebank_logo.png"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Get.to(() => Contatos());
            },
            child: Container(
              padding: const EdgeInsets.all(21.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Icon(Icons.people, color: Colors.white,size: 30,),
                    Text("Contatos", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}