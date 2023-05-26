import 'package:flutter/material.dart';

import 'design/design.dart';

class MaisMeanings extends StatefulWidget {
  String? palavra;
  int? comprimento;
  List<dynamic>? meanings;
  MaisMeanings({this.palavra, required this.meanings, required this.comprimento});

  @override
  State<MaisMeanings> createState() => _MaisMeaningsState();
}

class _MaisMeaningsState extends State<MaisMeanings> {

  double? alturaRelativa;

  _calcularAlturaRelativa(int comprimento){
    setState(() {
      alturaRelativa = comprimento.toDouble()*12;
    });
  }

  @override
  void initState() {
    super.initState();
    _calcularAlturaRelativa(widget.comprimento!);
  }

  @override
  Widget build(BuildContext context) {

    print(widget.meanings);

    return Scaffold(
      backgroundColor: corAmarelo,
      appBar: AppBar(
        title: TextoPadrao(
          texto: 'Significados de ${widget.palavra}',
          color: corBranco,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: corPreto,
      ),

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          height: double.infinity,
          color: corBranco,
          child: ListView.builder(
              itemCount: widget.meanings!.length,
              itemBuilder: (_, index){
                var item = widget.meanings![index];

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
      ),
    );
  }
}
