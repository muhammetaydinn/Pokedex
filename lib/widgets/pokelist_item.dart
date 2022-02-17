import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constans/constants.dart';

import '../model/pokemon_model.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: Colors.white,
      color: Colors.red.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Column(children: [
        Text(
          pokemon.name ?? "NaN",
          style: Constants.getPokemonNameTextStyle(),
        ),
        Chip(
            label: Text(
          pokemon.type![0],
          style: Constants.getTypeChipTextStyle(),
        )),
      ]),
    );
  }
}
