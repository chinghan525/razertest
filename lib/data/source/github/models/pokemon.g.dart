// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubPokemonModel _$GithubPokemonModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['name', 'id']);
  return GithubPokemonModel(
    json['name'] as String,
    json['id'] as String,
    json['email'] as String? ?? '',
    json['address'] as String? ?? '',
    json['gender'] as String? ?? '',
    Phone.fromJson(json['phone'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GithubPokemonModelToJson(GithubPokemonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'email': instance.email,
      'address': instance.address,
      'gender': instance.gender,
      'phone': instance.phone,
    };
