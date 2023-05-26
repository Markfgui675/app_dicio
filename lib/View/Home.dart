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

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 150,
                child: Observer(
                  builder: (_){
                    return ListView.builder(
                      itemCount: controller.resultadoPartOfSpeech.length,
                      itemBuilder: (_, index){

                        var item = controller.resultadoPartOfSpeech[index];
                        print('=-=-=- partOfSpeech:  ${item.toString()}');

                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item)
                            ],
                          ),
                        );

                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 30,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 450,
                child: Observer(
                  builder: (_){
                    return ListView.builder(
                      itemCount: controller.resultadoMeanings.length,
                      itemBuilder: (_, index){

                        var item = controller.resultadoMeanings[index];
                        print('=-=-=- meanings:  ${item.toString()}');

                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.toString())
                            ],
                          ),
                        );

                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 30,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 150,
                child: Observer(
                  builder: (_){
                    return ListView.builder(
                      itemCount: controller.resultadoEtymology.length,
                      itemBuilder: (_, index){

                        var item = controller.resultadoEtymology[index];
                        print('=-=-=- etymology:  ${item.toString()}');

                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item)
                            ],
                          ),
                        );

                      },
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}

