import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../Controller/mobx.dart';
import 'design/design.dart';

class PesquisaScreen extends StatefulWidget {
  const PesquisaScreen({Key? key}) : super(key: key);

  @override
  State<PesquisaScreen> createState() => _PesquisaScreenState();
}

class _PesquisaScreenState extends State<PesquisaScreen> {

  Controller controller = Controller();
  TextEditingController _controllerPalavra = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            TextoPadrao(
              texto: 'Categoria Gramatical',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: corPreto,
            ),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: corBranco
              ),
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
            TextoPadrao(
              texto: 'Significados',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: corPreto,
            ),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: corBranco
              ),
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
            TextoPadrao(
              texto: 'Etimologia',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: corPreto,
            ),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: corBranco
              ),
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
    );
  }
}

