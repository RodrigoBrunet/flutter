import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Incricoes.dart';
import 'package:youtube/telas/Inicio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int _indiceAtual = 0;
  String _resultado = "";
  
  
  @override
  Widget build(BuildContext context) {

    
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Incricoes(),
      Biblioteca()
    ];


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
          ),
        actions: <Widget>[
          
           IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
            },
          ), 

          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("ação: video cam");
            },
          ),
          
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("ação: conta");
            },
          )*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text("inicio"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text("em alta"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            title: Text("inscrições"),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            title: Text("biblioteca"),
            icon: Icon(Icons.folder)
          ),
   
        ]
      ),
    );
  }
}