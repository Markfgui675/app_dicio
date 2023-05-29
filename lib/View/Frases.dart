import 'package:app_dicio/View/design/primeiraPesquisa.dart';
import 'package:app_dicio/View/design/semResultado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../Controller/mobx.dart';
import 'design/PrimeiraFrase.dart';
import 'design/design.dart';

class FrasesScreen extends StatefulWidget {
  const FrasesScreen({Key? key}) : super(key: key);

  @override
  State<FrasesScreen> createState() => _FrasesScreenState();
}

class _FrasesScreenState extends State<FrasesScreen> {

  Controller controller = Controller();
  TextEditingController _controllerPalavra = TextEditingController();

  String _palavraPesquisada = '';
  String _textoPadrao = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          //Barra de pesquisa
          Container(
            width: double.infinity,
            height: 80,
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _controllerPalavra,
                      keyboardType: TextInputType.text,
                      style: estiloTexto(fontSize: 14, fontWeight: FontWeight.bold),
                      enableSuggestions: true,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (palavra){
                        setState(() {
                          _palavraPesquisada = _controllerPalavra.text;
                          if(_palavraPesquisada != ''){
                            _textoPadrao = 'Resultados para: $_palavraPesquisada';
                          }
                        });
                        if(_controllerPalavra.text != ''){
                          controller.pesquisar(_controllerPalavra.text.toLowerCase(), 'frases');
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: 'Busque por frases...',
                          hintStyle: estiloTexto(fontSize: 14, fontWeight: FontWeight.bold, color: corPreto),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    )
                ),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _palavraPesquisada = _controllerPalavra.text;
                          if(_palavraPesquisada != ''){
                            _textoPadrao = 'Resultados para: $_palavraPesquisada';
                          }
                        });
                        if(_controllerPalavra.text != ''){
                          controller.pesquisar(_controllerPalavra.text.toLowerCase(), 'frases');
                        }
                      },
                      child: const CircleAvatar(
                        backgroundColor: corVermelho,
                        radius: 30,
                        child: Icon(Icons.search, color: corPreto,),
                      ),
                    )
                ),
              ],
            ),
          ),

          // resposta imediata para a requisição do usuário
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextoPadrao(
                  texto: _textoPadrao,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: corVermelho,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // resultados
          Observer(
              builder: (_){

                if(controller.Json.isEmpty && controller.statusCode == 0){
                  return const PrimeiraFrase();
                }
                if(controller.Json.isEmpty && controller.statusCode != 200){
                  return const SemResultado();
                }
                if(controller.Json.isNotEmpty && controller.statusCode == 200){

                  return Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    height: 500,
                    child: Observer(
                      builder: (_){

                        return ListView.builder(
                          itemCount: controller.resultadoFrases.length,
                          itemBuilder: (_, index){

                            var item = controller.resultadoFrases[index];

                            return Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: corBranco
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextoPadrao(
                                    texto: item['sentence'],
                                    color: corPreto,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  TextoPadrao(
                                    texto: item['author'],
                                    color: corPreto,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  )
                                ],
                              ),
                            );

                          }
                        );

                      },
                    ),
                  );

                }
                return Container();

              }
          )

        ],
      ),
    );
  }
}

