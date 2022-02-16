import 'package:flutter/material.dart';

class AppTile extends StatefulWidget {
  const AppTile({Key? key}) : super(key: key);

  @override
  State<AppTile> createState() => _AppTileState();
}

class _AppTileState extends State<AppTile> {
  final String _pokePng = "assets/images/poke.png";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Text("Pokedex"),
        Image.asset(
          _pokePng,
          width: 100,
          height: 100,
          fit: BoxFit.fitWidth,
          color: Colors.grey.withOpacity(0.3),
        )
      ],
    );
  }
}
