import 'package:flutter/material.dart';

class Incricoes extends StatefulWidget {
  @override
  _IncricoesState createState() => _IncricoesState();
}

class _IncricoesState extends State<Incricoes> {
  @override
  Widget build(BuildContext context) {
  return Container(
      child: Center(
        child: Text(
          "Inscrições",
          style: TextStyle(
            fontSize: 25
          ),
        ),
      ),
      
    );
  }
}