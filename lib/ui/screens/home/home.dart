import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/ui/widgets/poke_news.dart';

part 'widgets/header_app_bar.dart';
part 'widgets/pokemon_news.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double appBarHeight = 0;
  bool showTitle = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appBarHeight = 0;

    return Scaffold(
      body: _PokemonNews(),
    );
  }
}
