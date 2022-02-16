import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"; //.json ile bittiği için text gibi dosyalardır bunları decode etmek gerekiyor.dio get ile baktıgımda string olarak gelidğini görürüz bundan dolayı sona dönüştürmeiyiz

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);
    var pokeList = jsonDecode(result.data)["pokemon"];
    //list olup olmadıgını kontrol et
    //list ise mapleyip her parçayı ayırdıktıktan sonra json dan list yap
    if (pokeList is List) {
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }
    //eger birdseyi tstring yaptıktan sonra da instance of seklinde gozukurse bunun model dosyasındakileri stringe donustur
    debugPrint(_list.toString());

    return _list;
  }
}
