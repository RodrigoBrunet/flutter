import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  
  List _listaTarefas = [];
  TextEditingController _controllerTarefa = TextEditingController();
  
  Future<File>_getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarTarefa(){
    String textoDigitado = _controllerTarefa.text;

    //criar dados
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;
    _listaTarefas.add(tarefa);

    _salvarArquivo();
  }


  _salvarArquivo() async{
    
    var arquivo = await _getFile();
            
    String dados = json.encode(_listaTarefas);
    return arquivo.writeAsStringSync(dados);
  }

   _lerArquivo () async{

      try{
        final arquivo = await _getFile();
        arquivo.readAsString();
      }catch(e){
        return null;
      }
  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados){
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    }
      
    );
  }


  
  @override
  Widget build(BuildContext context) {
    _salvarArquivo();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: (){

            showDialog(
                context: context,
              builder: (context){

                  return AlertDialog(
                    title: Text("Adicionar Tarefa"),
                    content: TextField(
                      controller: _controllerTarefa,
                      decoration: InputDecoration(
                        labelText: "Digite sua tarefa"
                      ),
                      onChanged: (text){

                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Cancelar"),
                        onPressed: () => Navigator.pop(context) ,
                      ),
                      FlatButton(
                        child: Text("Salvar"),
                        onPressed: (){
                          //salvar
                          _salvarTarefa();

                          Navigator.pop(context);
                        },
                      )
                    ],
                  );

              }
            );

          }
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
                itemBuilder: (context, index){

                  return ListTile(
                    title: Text( _listaTarefas[index] ["ir ao mercado"] ),
                  );

                }
            ),
          )
        ],
      ),
    );
  }
}
  
