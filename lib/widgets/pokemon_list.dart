import 'package:flutter/material.dart';
import 'package:pokedex/services/pokedex_api.dart';

import '../model/pokemon_model.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final Future<List<PokemonModel>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var pokeList = snapshot.data!;
          return ListView.builder(
            itemCount: pokeList.length,
            itemBuilder: (context, index) {
              var pokemon = pokeList[index];
              return ListTile(
                title: Text(pokemon.name.toString()),
                subtitle: Text(pokemon.type.toString()),
              );
            },
          );
        } else if (snapshot.hasError) {
          debugPrint("35");
          return const Center(
            child: Text("404 veri gelmio"),
          );
        } else {
          debugPrint("38");
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
