import 'package:flutter/material.dart';

void main() => runApp(SimpleCalc());

class SimpleCalc extends StatefulWidget {
  SimpleCalc({Key? key}) : super(key: key);

  @override
  _SimpleCalcState createState() => _SimpleCalcState();
}

class _SimpleCalcState extends State<SimpleCalc> {
  String resultado = "";
  double num1 = 0.0;
  double num2 = 0.0;

  @override
  Widget build(BuildContext context) {
    TextField n1 = TextField(
        style: TextStyle(color: Colors.deepOrange),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Primeiro número:',
            labelStyle: TextStyle(color: Colors.deepOrange),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 2.0))),
        onChanged: (value) {
          num1 = double.parse(value);
        });

    TextField n2 = TextField(
      style: TextStyle(color: Colors.deepOrange),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Segundo número:',
          labelStyle: TextStyle(color: Colors.deepOrange),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0))),
      onChanged: (value) => num2 = double.parse(value),
    );

    Padding clearfix = Padding(padding: EdgeInsets.all(5.0));

    ElevatedButton btn = ElevatedButton(
      onPressed: () {
        setState(() {
          double calc = num1 + num2;
          this.resultado =
              "O resultado da soma dos valores é: ${calc.toStringAsFixed(2)}";
        });
      },
      child: Text('Somar'),
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrange, // background
        onPrimary: Colors.white, // foreground
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    Text resultado =
        Text(this.resultado, style: TextStyle(color: Colors.deepOrange));

    Column cols = Column(
      children: <Widget>[
        n1,
        clearfix,
        n2,
        clearfix,
        SizedBox(child: btn, width: double.infinity),
        clearfix,
        resultado
      ],
    );

    return MaterialApp(
      title: 'Simples Calculadora',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Padding(
          padding: EdgeInsets.all(18.0),
          child: cols,
        ),
      ),
    );
  }
}
