import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pockedex/models/pokemon_model.dart';
import 'package:flutter_codigo5_pockedex/ui/general/colors.dart';

import 'item_type_widget.dart';

class ItemGridWidget extends StatelessWidget {
  //String name, imageUrl;
  //List<String> type;
  PokemonModel pokemon;

  ItemGridWidget({
    Key? key,
    //required this.name,
    //required this.imageUrl,
    // required this.type,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorPokemon[pokemon.type[0]],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -25,
            right: -14,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 110,
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.27),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.network(pokemon.img),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          pokemon.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      "#${pokemon.id}",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.2)),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemon.type
                      .map<Widget>((item) => ItemTypeWidget(type: item))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
