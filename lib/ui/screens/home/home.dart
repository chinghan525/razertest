import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/source/github/models/contact_response.dart';
import 'package:pokedex/domain/entities/contact.dart';
import 'package:pokedex/states/home/home_bloc.dart';
import 'package:pokedex/states/home/home_event.dart';
import 'package:pokedex/states/home/home_state.dart';
import 'package:pokedex/ui/widgets/user_cardview.dart';
import 'package:provider/src/provider.dart';

part 'widgets/header_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double appBarHeight = 0;
  bool showTitle = false;

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<HomeBloc>().add(HomeLoadStarted(loadAll: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    appBarHeight = 0;
    scheduleMicrotask(() {
      context.read<HomeBloc>().add(HomeLoadStarted(loadAll: true));
    });

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (_, state) {
            if (state.error != null) {
              return _buildError();
            }

            return _buildContent(state.contacts);
          },
        ),
      ),
    );
  }

  Widget _buildError() => Container(
        padding: EdgeInsets.only(bottom: 28),
        alignment: Alignment.center,
        child: Icon(
          Icons.warning_amber_rounded,
          size: 60,
          color: Colors.black26,
        ),
      );

  Widget _buildContent(List<ContactResponse> contacts) => ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(contacts[position]);
      });

  Widget getRow(ContactResponse contact) {
    return GestureDetector(
      child: UserCardView(
        contact: contact,
      ),
      onTap: () {
        setState(() {});
      },
    );
  }
}
