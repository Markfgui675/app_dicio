import 'package:app_dicio/View/MaisMeanings.dart';
import 'package:app_dicio/View/design/primeiraPesquisa.dart';
import 'package:app_dicio/View/design/semResultado.dart';
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
  final TextEditingController _controllerPalavra = TextEditingController();

  List<dynamic> meanings = [];

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
                        controller.pesquisar(_controllerPalavra.text.toLowerCase(), 'significados');
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      hintText: 'Busque por significados...',
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
                        controller.pesquisar(_controllerPalavra.text.toLowerCase(), 'significados');
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
                  return const PrimeiraPesquisa();
                }
                if(controller.Json.isEmpty && controller.statusCode != 200){
                  return const SemResultado();
                }
                if(controller.Json.isNotEmpty && controller.statusCode == 200){
                  meanings.clear();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextoPadrao(
                        texto: 'Classe Gramatical',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: corPreto,
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width*0.85,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: corBranco
                        ),
                        child: Observer(
                          builder: (_){
                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: controller.partOfSpeech.length,
                                itemBuilder: (_, index){
                                  var item = controller.resultadoPartOfSpeech[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: TextoPadrao(texto: item, fontWeight: FontWeight.normal, fontSize: 16, color: corPreto,),
                                  );
                                }
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),

                      TextoPadrao(
                        texto: 'Significados',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: corPreto,
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width*0.85,
                        height: 600,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: corBranco
                        ),
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: controller.resultadoMeanings.length,
                            itemBuilder: (_, index){
                              var item = controller.resultadoMeanings[index];
                              meanings.add(item);

                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextoPadrao(
                                      texto: item.toString(),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: corPreto,
                                    )
                                  ],
                                ),
                              );
                            }
                        ),
                      ),
                      const SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MaisMeanings(palavra: _controllerPalavra.text,meanings: meanings, comprimento: meanings.length,)
                              )
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.85,
                          height: 60,
                          decoration: BoxDecoration(
                            color: corVermelho,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: TextoPadrao(
                              texto: 'Ver mais significados',
                              color: corBranco,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),

                      TextoPadrao(
                        texto: 'Etimologia',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: corPreto,
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width*0.85,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: corBranco
                        ),
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: controller.resultadoEtymology.length,
                            itemBuilder: (_, index){
                              var item = controller.resultadoEtymology[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextoPadrao(texto: item, fontWeight: FontWeight.normal, fontSize: 16, color: corPreto,),
                              );
                            }
                        ),
                      ),
                      const SizedBox(height: 20,),

                    ],
                  );
                }
                return Container();
              }
          ),
        ],
      ),
    );
  }
}

