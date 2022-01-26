import 'package:hive/hive.dart';
import 'package:pokedex/data/source/github/models/phone_response.dart';

part 'contact.g.dart';

@HiveType(typeId: 1)
class ContactHiveModel extends HiveObject {
  static const String boxKey = 'pokemon';

  @HiveField(0)
  late String number;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String email;

  @HiveField(3)
  late String address;

  @HiveField(4)
  late String gender;

  @HiveField(5)
  late Phone phone;
}
