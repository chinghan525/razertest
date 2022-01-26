import 'package:flutter/material.dart';
import 'package:razertest/data/source/github/models/contact_response.dart';
import 'package:razertest/routes.dart';

class UserCardView extends StatelessWidget {
  const UserCardView({
    required this.contact,
  });

  final ContactResponse contact;

  Widget _buildContent(BuildContext context) {
    var name = contact.name;
    var id = contact.id;
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            AppNavigator.push(Routes.userprofile, contact);
          },
          child: Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvaqRdxGoQ1qP5Ia6RUExqTixoPRDglzT_IdbWCPnXA2nC6cOas6ihdIXjAdKhqSls9B8&usqp=CAU'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Name: $name', textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text('Id: $id', textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            child: _buildContent(context),
          ),
        ],
      ),
    );
  }
}
