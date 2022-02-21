import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constans/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_information.dart';
import 'package:pokedex/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final String _pokePng = "assets/images/poke.png";
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIhelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: Image.asset(_pokePng),
                          width: 150,
                          top: 50,
                          left: 250,
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.arrow_back_ios)),
                            ),
                            PokeTypeName(pokemon: pokemon),
                            SizedBox(
                              height: 20.h + 20,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                    child: Stack(
                  children: [
                    PokeInformation(pokemon: pokemon),
                  ],
                )),
              ],
            ),
            Positioned(
                left: 0.32.sw,
                top: 0.11.sh,
                child: CachedNetworkImage(
                  imageUrl: pokemon.img ?? "",
                  height: 0.22.sh,
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
