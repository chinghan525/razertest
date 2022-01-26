import 'dart:collection';

import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/github/models/contact_response.dart';

class GithubDataSource {
  static const String url = 'https://api.androidhive.info/contacts/';

  GithubDataSource(this.networkManager);

  final NetworkManager networkManager;

  Future<List<ContactResponse>> getContacts() async {
    final response = await networkManager.request(RequestMethod.get, url);
    final item = (response.data as LinkedHashMap)["contacts"];

    final data = (item as List)
        .map((item) => ContactResponse.fromJson(item))
        .toList();

    return data;
  }
}
