import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pockedex/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

import '../widgets/item_grid_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pockemonList = [];
  List<PokemonModel> pokemonModelList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataPockemon();
  }

  getDataPockemon() async {
    //https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);
    //print(response.statusCode);
    //print(response.body); //String

    //Primero hay que identificar el tipo de objeto con que responde el backend
    //El backend
    Map<String, dynamic> myMap =
        json.decode(response.body); // convierte el texto json en mapa.
    //Poblamos la lista con la lista de mapas pockemon.
    pockemonList = myMap["pokemon"];
    pokemonModelList =
        pockemonList.map(((e) => PokemonModel.fromJson(e))).toList();
    setState(() {});
    //print(myMap);
    // print("=================== \n");
    // print(myMap["pokemon"][0]);
    // print("=================== \n");
    // print("name: " + myMap["pokemon"][0]["name"]);
    // print("Nextevolucion name: " + myMap["pokemon"][0]["next_evolution"][0]["name"]);

/*
    //Metodo para iterar el mapa y trael los nombres:
    myMap["pockemon"].forEach((itemMap) {
      print(itemMap['name']);
    });
 */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Text(
                  "Pockedex",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.4,
                  children: pokemonModelList
                      .map<Widget>(
                        (e) => ItemGridWidget(
                          name: e.name,
                          imageUrl: e.img,
                          type: e.type,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
