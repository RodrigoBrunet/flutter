import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mesagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
    
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case "pedra" :
      setState(() {
        this._imagemApp = AssetImage("imagens/pedra.png");
      });
      break;

      case "papel" :
      setState(() {
        this._imagemApp = AssetImage("imagens/papel.png");
      });
      break;

      case "tesoura" :
      setState(() {
        this._imagemApp = AssetImage("imagens/tesoura.png");
      });
      break;
    }

    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")   ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") 
    ){
      setState(() {
        this._mesagem = "Parabéns!!! você ganhou :)";
      });

    }else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      setState(() {
        this._mesagem = "você perdeu :(";
      });
    }else{
      setState(() {
        this._mesagem = "Empatamos";
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel e Tesoura"),
      ) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App !!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
            ),
          ),
           Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mesagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap:() => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap:() => _opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap:() => _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100,),
              )
              
            ],
          )
        ],
      ),
    );
  }
}