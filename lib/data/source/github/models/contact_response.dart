import 'package:json_annotation/json_annotation.dart';
import 'package:razertest/data/source/github/models/phone_response.dart';

part 'contact_response.g.dart';

@JsonSerializable()
class ContactResponse {
  ContactResponse(
    this.name,
    this.id,
    this.email,
    this.address,
    this.gender,
    this.phone,
  );

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);

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
