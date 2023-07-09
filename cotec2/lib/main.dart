import 'package:flutter/material.dart';

void main() => runApp(CotecApp2());

class CotecApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Segundo APP',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Meu Segundo App'),
              centerTitle: true,
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Text('Primeira Coluna'),
                  Text('Segunda Coluna', style: TextStyle(color: Colors.green)),
                  TextField(),
                  Row(
                    children: <Widget>[Text('Texto01'), Text('Texto02')],
                  ),
                  ElevatedButton(
                    child: Text("Enviar"),
                    onPressed: () {
                      print('Teste');
                    },
                  )
                ],
              ),
            )));
  }
}
