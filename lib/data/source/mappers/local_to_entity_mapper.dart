import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

extension PokemonHiveModelX on PokemonHiveModel {
  Pokemon toEntity({List<PokemonHiveModel> evolutions = const []}) => Pokemon(
      number: number.trim(),
      name: name.trim(),
      email: email.trim(),
      address: address.trim(),
      gender: gender.trim(),
      phone: phone);
}
