import 'package:flutter/material.dart';

void main() => runApp(MeuProjeto());

class MeuProjeto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Segundo Aplicativo', //Titulo do navegador
        home: Scaffold(
          appBar: AppBar(
            title: Text('Meu Segundo Aplicativo'),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
          ),
          body: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Text('Primeira coluna'),
                Text(
                  'Segunda coluna',
                  style: TextStyle(color: Colors.green),
                ),
                TextField(),
                Row(
                  children: <Widget>[Text('Texto 01'), Text('Texto 02')],
                ),
                ElevatedButton(
                    onPressed: () {
                      print("Teste");
                    },
                    child: Text('Enviar'))
              ],
            ),
          ),
        ));
  }
}
