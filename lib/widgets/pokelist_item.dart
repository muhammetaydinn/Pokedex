import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constans/constants.dart';
import 'package:pokedex/constans/ui_helper.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/widgets/poke_ball_and_image.dart';

import '../model/pokemon_model.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  PokeListItem({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Card(
        elevation: 0,
        shadowColor: Colors.white,
        color: UIhelper.getColorFromType(pokemon.type![0]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Padding(
          padding: UIhelper.getDefaultPadding(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name ?? "NaN",
                  style: Constants.getPokemonNameTextStyle(),
                ),
                Chip(
                    label: Text(
                  pokemon.type![0],
                  style: Constants.getTypeChipTextStyle(),
                )),
                Expanded(child: PokeImageAndBall(pokemon: pokemon)),
              ]),
        ),
      ),
    );
  }
}
