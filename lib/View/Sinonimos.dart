import 'package:flutter/material.dart';

class SinonimosScreen extends StatefulWidget {
  const SinonimosScreen({Key? key}) : super(key: key);

  @override
  State<SinonimosScreen> createState() => _SinonimosScreenState();
}

class _SinonimosScreenState extends State<SinonimosScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Sinônimos'),
    );
  }
}

