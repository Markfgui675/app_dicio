import 'dart:convert';

import 'package:app_dicio/View/Frases.dart';
import 'package:app_dicio/View/Pesquisa.dart';
import 'package:app_dicio/View/Sinonimos.dart';
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

  List<Widget> telas = [
    PesquisaScreen(),
    SinonimosScreen(),
    FrasesScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
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
          padding: EdgeInsets.only(bottom: 70),
          child: telas[_page],
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: [
          CurvedNavigationBarItem(
            child: const Icon(Icons.search, color: corBranco,),
            label: 'Pesquisar',
            labelStyle: estiloTexto(fontSize: 14, fontWeight: FontWeight.bold, color: corBranco)
          ),
          CurvedNavigationBarItem(
              child: const Icon(Icons.text_fields, color: corBranco,),
              label: 'Sinônimos',
              labelStyle: estiloTexto(fontSize: 14, fontWeight: FontWeight.bold, color: corBranco)
          ),
          CurvedNavigationBarItem(
              child: const Icon(Icons.text_snippet, color: corBranco,),
              label: 'Frases',
              labelStyle: estiloTexto(fontSize: 14, fontWeight: FontWeight.bold, color: corBranco)
          )
        ],
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: corVermelho,
        color: corVermelho,
        animationCurve: Curves.easeInQuad,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index){
          setState(() {
            _page = index;
          });
        },
      ),

    );
  }
}

