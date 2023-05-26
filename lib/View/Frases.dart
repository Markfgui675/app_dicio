import 'package:flutter/material.dart';

class FrasesScreen extends StatefulWidget {
  const FrasesScreen({Key? key}) : super(key: key);

  @override
  State<FrasesScreen> createState() => _FrasesScreenState();
}

class _FrasesScreenState extends State<FrasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Frases'),
    );
  }
}

