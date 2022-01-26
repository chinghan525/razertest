import 'package:pokedex/data/source/local/models/contact.dart';
import 'package:pokedex/domain/entities/contact.dart';

extension PokemonHiveModelX on ContactHiveModel {
  Contact toEntity({List<ContactHiveModel> evolutions = const []}) => Contact(
      number: number.trim(),
      name: name.trim(),
      email: email.trim(),
      address: address.trim(),
      gender: gender.trim(),
      phone: phone);
}
