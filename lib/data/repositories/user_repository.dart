import 'package:razertest/data/source/github/github_datasource.dart';
import 'package:razertest/data/source/github/models/contact_response.dart';

abstract class UserRepository {
  Future<List<ContactResponse>> getAllContacts();
}

class UserDefaultRepository extends UserRepository {
  UserDefaultRepository({required this.githubDataSource});

  final GithubDataSource githubDataSource;

  @override
  Future<List<ContactResponse>> getAllContacts() async {
    final contactResponse = await githubDataSource.getContacts();

    return contactResponse;
  }
}
