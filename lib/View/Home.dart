import 'dart:convert';

import 'package:app_dicio/View/design/design.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
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
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: corAmarelo,
      appBar: AppBar(
        title: TextoPadrao(
          texto: 'Dicionário Rápido e Fácil',
          color: corBranco,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: corPreto,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                controller: _controllerPalavra,
                enableSuggestions: true,
                onChanged: controller.setPalavra,
                style: estiloTexto,
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  hintStyle: estiloTexto
                ),
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
      ),

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: [
          CurvedNavigationBarItem(
            child: const Icon(Icons.search, color: corBranco,),
            label: 'Pesquisar',
            labelStyle: estiloTextoBoldd
          ),
          CurvedNavigationBarItem(
              child: const Icon(Icons.text_fields, color: corBranco,),
              label: 'Sinônimos',
              labelStyle: estiloTextoBoldd
          ),
          CurvedNavigationBarItem(
              child: const Icon(Icons.text_snippet, color: corBranco,),
              label: 'Frases',
              labelStyle: estiloTextoBoldd
          )
        ],
        backgroundColor: corAmarelo,
        buttonBackgroundColor: corVermelho,
        color: corVermelho,
        animationCurve: Curves.easeInQuad,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index){
          setState(() {
            _page = index;
          });
        },
      ),

    );
  }
}

