import 'package:flutter/material.dart';
import 'package:you_flutter/screens/home.dart';

void main() => runApp(YouFlutter());

class YouFlutter extends StatelessWidget {
  const YouFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouFlutter',
      home: Home(),
    );
  }
}
