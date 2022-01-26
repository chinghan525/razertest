import 'package:pokedex/data/source/github/github_datasource.dart';
import 'package:pokedex/data/source/mappers/github_to_local_mapper.dart';
import 'package:pokedex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:pokedex/domain/entities/contact.dart';

abstract class UserRepository {
  Future<List<Contact>> getAllContacts();

  Future<List<Contact>> getContact({required int limit, required int page});
}

class UserDefaultRepository extends UserRepository {
  UserDefaultRepository({required this.githubDataSource});

  final GithubDataSource githubDataSource;

  @override
  Future<List<Contact>> getAllContacts() async {
    final contactResponse = await githubDataSource.getContacts();
    final contactHiveModels = contactResponse.map((e) => e.toHiveModel());
    final contactEntities = contactHiveModels.map((e) => e.toEntity()).toList();

    return contactEntities;
  }

  @override
  Future<List<Contact>> getContact(
      {required int limit, required int page}) async {
    final contactResponse = await githubDataSource.getContacts();
    final contactHiveModels = contactResponse.map((e) => e.toHiveModel());
    final contactEntities = contactHiveModels.map((e) => e.toEntity()).toList();

    return contactEntities;
  }
}
