import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/source/github/models/phone_response.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class GithubPokemonModel {
  GithubPokemonModel(
    this.name,
    this.id,
    this.email,
    this.address,
    this.gender,
    this.phone,
  );

  factory GithubPokemonModel.fromJson(Map<String, dynamic> json) =>
      _$GithubPokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$GithubPokemonModelToJson(this);

  @JsonKey(disallowNullValue: true)
  final String name;

  @JsonKey(disallowNullValue: true)
  final String id;

  @JsonKey(defaultValue: '')
  final String email;

  @JsonKey(defaultValue: '')
  final String address;

  @JsonKey(defaultValue: '')
  final String gender;

  final Phone phone;
}
