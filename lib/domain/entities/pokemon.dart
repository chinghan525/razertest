import 'package:pokedex/data/source/github/models/phone_response.dart';

class Pokemon {
  const Pokemon({
    required this.number,
    required this.name,
    required this.email,
    required this.address,
    required this.gender,
    required this.phone,
  });

  final String number;
  final String name;
  final String email;
  final String address;
  final String gender;
  final Phone phone;
}
