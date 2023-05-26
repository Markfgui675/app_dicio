import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color corPreto = Color(0xff433e3f);
const Color corBranco = Color(0xfff2f1f9);
const Color corAmarelo = Color(0xfff2d0a4);
const Color corVermelho = Color(0xfff24236);

TextStyle estiloTexto({required double fontSize, required FontWeight fontWeight, Color color = corPreto}){
  var estiloTextoBoldd = GoogleFonts.workSans().copyWith(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color
  );
  return estiloTextoBoldd;
}

class TextoPadrao extends StatelessWidget {
  String? texto;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;

  TextoPadrao({
    this.texto,
    this.fontSize = 14.0,
    this.color = const Color(0xff433e3f),
    this.fontWeight = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.texto!,
      style: GoogleFonts.workSans().copyWith(
        fontSize: this.fontSize,
        color: this.color,
        fontWeight: this.fontWeight
      ),
    );
  }
}
