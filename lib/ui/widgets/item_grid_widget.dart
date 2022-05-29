import 'package:flutter/material.dart';
import '../../models/pokemon_model.dart';
import '../../pages/pokemon_detail_page.dart';
import '../general/colors.dart';
import 'item_type_widget.dart';

class ItemGridWidget extends StatelessWidget {
  // String name;
  // String image;
  // List<String> type;

  PokemonModel pokemon;

  ItemGridWidget({
    // required this.name,
    // required this.image,
    // required this.type,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PokemonDetailPage(
                      pokemon: pokemon,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorPokemon[pokemon.type[0]],
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -24,
              right: -14,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 120,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(
                pokemon.img,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
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
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Text(
                        "#${pokemon.id}",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Expanded(child: Container()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.type
                        .map<Widget>((e) => ItemTypeWidget(
                              type: e,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
