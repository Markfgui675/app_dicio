import 'package:flutter/material.dart';

import 'design.dart';

class PrimeiraFrase extends StatelessWidget {
  const PrimeiraFrase({Key? key}) : super(key: key);

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
            texto: 'Busque por exemplos de frases',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: corPreto,
          )
        ],
      ),
    );
  }
}

