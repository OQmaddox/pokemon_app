import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:core';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi='https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List listPokedex=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4
          ), itemCount: listPokedex.length,
          itemBuilder: (context,index){
            return Card();
          },))
        ],
      )
    );
  }

  void fetchPokemonData(){
    var url= Uri.https("raw.githubusercontent.com","/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value){
      if(value.statusCode==200){
        var jsonResponse=convert.jsonDecode(value.body);
        listPokedex=jsonResponse['pokemon'];
        print(listPokedex);
      }
    });

     print('Hola mundo ');
  }
}
