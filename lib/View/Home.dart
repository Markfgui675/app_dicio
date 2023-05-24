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

  dynamic partOfSpeech = [];
  List<dynamic> meanings = [];
  dynamic etymology = [];

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
              onChanged: controller.setPalavra,
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  controller.pesquisar(_controllerPalavra.text);
                },
                child: Text('Pesquisar')
            ),
            SizedBox(height: 50,),

            Observer(
                builder: (_){
                  partOfSpeech = controller.resultado[0]['partOfSpeech'];
                  print('=-=-=- partOfSpeech:  ${partOfSpeech.toString()}');

                  return Text(partOfSpeech.toString());

                }
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Observer(
                builder: (_){
                  return ListView.builder(
                    itemCount: controller.resultado.length,
                    itemBuilder: (_, index){

                      var item = controller.resultado[index];
                      partOfSpeech = controller.resultado[index]['partOfSpeech'];
                      print('=-=-=- partOfSpeech:  ${partOfSpeech.toString()}');
                      meanings = controller.resultado[index]['meanings'];
                      print('=-=-=- meanings:  ${meanings.toString()}');
                      etymology = controller.resultado[index]['etymology'];
                      print('=-=-=- etymology:  ${etymology.toString()}');

                      return Container(
                        width: double.infinity,
                        height: 400,
                        child: Column(
                          children: [
                            Text(item.toString())
                          ],
                        ),
                      );

                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

