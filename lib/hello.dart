import 'package:flutter/material.dart';

class Hello extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title: const Text('Hello World!'),
        backgroundColor: Colors.blue,
      ),
      body: const Text('This is some mine Text!!'),
    );
  }
}