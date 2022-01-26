import 'package:json_annotation/json_annotation.dart';

part 'phone_response.g.dart';

@JsonSerializable()
class Phone {
  final String mobile;
  final String home;
  final String office;

  Phone({
    required this.mobile,
    required this.home,
    required this.office,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneToJson(this);
}
