import 'package:app_dicio/View/design/PrimeiroSinonimo.dart';
import 'package:app_dicio/View/design/semResultado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../Controller/mobx.dart';
import 'design/design.dart';

class SinonimosScreen extends StatefulWidget {
  const SinonimosScreen({Key? key}) : super(key: key);

  @override
  State<SinonimosScreen> createState() => _SinonimosScreenState();
}

class _SinonimosScreenState extends State<SinonimosScreen> {

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
                          controller.pesquisar(_controllerPalavra.text.toLowerCase(), 'sinonimos');
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: 'Busque por sinônimos...',
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
                          controller.pesquisar(_controllerPalavra.text.toLowerCase(), 'sinonimos');
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
                return const PrimeiroSinonimo();
              }
              if(controller.Json.isEmpty && controller.statusCode != 200){
                return const SemResultado();
              }
              if(controller.Json.isNotEmpty && controller.statusCode == 200){

                return Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  height: 470,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: corBranco
                  ),
                  child: Observer(
                    builder: (_){

                      return ListView.builder(
                        itemCount: controller.resultadoSinonimos.length,
                        itemBuilder: (_, index){
                          var item = controller.resultadoSinonimos[index];
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: TextoPadrao(
                              texto: item,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: corPreto,
                            ),
                          );
                        }
                      );

                    },
                  ),
                );

              }

              return Container();

            },
          )

        ],
      ),
    );
  }
}

