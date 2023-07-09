import 'package:flutter/material.dart';

void main() => runApp(Cotec());

class Cotec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meu aplicativo',
        home: Scaffold(
            appBar: AppBar(
                title: Text('Aula de Flutter'),
                backgroundColor: Colors.deepOrange),
            body: Center(
                child: Text('Texto do corpo, agora centralizado na Tela!'))));
  }
}
