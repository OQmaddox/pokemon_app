import 'package:apppk/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeScreen()
    );
  }
}


