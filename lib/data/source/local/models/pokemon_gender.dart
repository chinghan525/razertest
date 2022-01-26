import 'package:hive/hive.dart';

part 'pokemon_gender.g.dart';

@HiveType(typeId: 2)
class PokemonGenderHiveModel extends HiveObject {
  static const String boxKey = 'pokemonGender';

  @HiveField(0)
  late String mobile;

  @HiveField(1)
  late String home;

  @HiveField(2)
  late String office;
}
