import 'package:flutter/material.dart';

void main() => runApp(MeuProjeto());

class MeuProjeto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: 'Meu Aplicativo',
        home: Scaffold(
            appBar: AppBar(title: Text('AULA MOBILE')),
            body: Center(
                child: Text('Texto do corpo, agora centralizado na tela:)'))));
  }
}
