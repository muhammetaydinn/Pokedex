import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constans/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  PokeImageAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _pokePng = "assets/images/poke.png";
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            _pokePng,height: UIhelper.calculatePokeImageAndBallSize(),width: UIhelper.calculatePokeImageAndBallSize(),
            color: Colors.grey.shade400.withOpacity(0.3),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
            imageUrl: pokemon.img ?? "",
            height: UIhelper.calculatePokeImageAndBallSize(),width: UIhelper.calculatePokeImageAndBallSize(),
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.red,
              strokeWidth: 8,
            ),
          ),
        )
      ],
    );
  }
}
