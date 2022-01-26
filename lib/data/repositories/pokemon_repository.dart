import 'package:pokedex/data/source/github/github_datasource.dart';
import 'package:pokedex/data/source/mappers/github_to_local_mapper.dart';
import 'package:pokedex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getAllPokemons();

  Future<List<Pokemon>> getPokemons({required int limit, required int page});
}

class PokemonDefaultRepository extends PokemonRepository {
  PokemonDefaultRepository({required this.githubDataSource});

  final GithubDataSource githubDataSource;

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    final pokemonGithubModels = await githubDataSource.getPokemons();
    final pokemonHiveModels = pokemonGithubModels.map((e) => e.toHiveModel());
    final pokemonEntities = pokemonHiveModels.map((e) => e.toEntity()).toList();

    return pokemonEntities;
  }

  @override
  Future<List<Pokemon>> getPokemons(
      {required int limit, required int page}) async {
    final pokemonGithubModels = await githubDataSource.getPokemons();
    final pokemonHiveModels = pokemonGithubModels.map((e) => e.toHiveModel());
    final pokemonEntities = pokemonHiveModels.map((e) => e.toEntity()).toList();

    return pokemonEntities;
  }
}
