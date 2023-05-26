import 'package:app_dicio/View/design/design.dart';
import 'package:flutter/material.dart';

class SemResultado extends StatelessWidget {
  const SemResultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        TextoPadrao(
          texto: 'Sem resultados para esta pesquisa...',
          color: corPreto,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )

      ],
    );
  }
}

