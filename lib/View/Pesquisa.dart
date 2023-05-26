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
                    onChanged: controller.setPalavra,
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
                      controller.pesquisar(_controllerPalavra.text);
                    },
                    child: CircleAvatar(
                      backgroundColor: corVermelho,
                      radius: 30,
                      child: Icon(Icons.search, color: corPreto,),
                    ),
                  )
                ),
              ],
            ),
          ),


          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Observer(
                builder: (_){

                  if(controller.Json.length == 0){
                    return Center(

                    );
                  }

                }
            ),
          )
        ],
      ),
    );
  }
}

