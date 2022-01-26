import 'package:pokedex/data/source/github/models/contact_response.dart';
import 'package:pokedex/data/source/local/models/contact.dart';

extension GithubPokemonModelToLocalX on ContactResponse {
  ContactHiveModel toHiveModel() => ContactHiveModel()
    ..number = id.trim()
    ..name = name.trim()
    ..email = email.trim()
    ..address = address.trim()
    ..gender = gender.trim()
    ..phone = phone;
}
