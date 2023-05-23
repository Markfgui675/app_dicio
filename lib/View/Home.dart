import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import '../Controller/mobx.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Controller controller = Controller();
  TextEditingController _controllerPalavra = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('App Dicio'),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: _controllerPalavra,
              enableSuggestions: true,
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  controller.setPalavra(_controllerPalavra.text);
                },
                child: Text('Pesquisar')
            ),
            SizedBox(height: 50,),



            Observer(
              builder: (_){
                return Column(
                  children: [
                    Text(
                      controller.Json.toString()
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

