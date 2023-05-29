import 'package:app_dicio/View/design/design.dart';
import 'package:flutter/material.dart';

class PrimeiraPesquisa extends StatelessWidget {
  const PrimeiraPesquisa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextoPadrao(
            texto: 'Busque por significados',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: corPreto,
          )
        ],
      ),
    );
  }
}

