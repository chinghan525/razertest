import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/states/pokemon/pokemon_event.dart';
import 'package:pokedex/states/pokemon/pokemon_state.dart';
import 'package:pokedex/ui/widgets/poke_news.dart';
import 'package:provider/src/provider.dart';

part 'widgets/header_app_bar.dart';

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

    scheduleMicrotask(() {
      context.read<PokemonBloc>().add(PokemonLoadStarted(loadAll: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    appBarHeight = 0;
    scheduleMicrotask(() {
      context.read<PokemonBloc>().add(PokemonLoadStarted(loadAll: true));
    });

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (_, state) {
            if (state.error != null) {
              return _buildError();
            }

            return _buildContent(state.pokemons);
          },
        ),
      ),
    );
  }

  Widget _buildError() => Container(
        padding: EdgeInsets.only(bottom: 28),
        alignment: Alignment.center,
        child: Icon(
          Icons.warning_amber_rounded,
          size: 60,
          color: Colors.black26,
        ),
      );

  Widget _buildContent(List<Pokemon> pokemons) => ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(pokemons[position]);
      });

  Widget getRow(Pokemon pokemon) {
    return GestureDetector(
      child: PokeNews(
        pokemon: pokemon,
      ),
      onTap: () {
        setState(() {});
      },
    );
  }
}
