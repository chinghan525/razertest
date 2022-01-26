import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razertest/configs/images.dart';
import 'package:razertest/data/source/github/models/contact_response.dart';
import 'package:razertest/states/home/home_bloc.dart';
import 'package:razertest/states/home/home_event.dart';
import 'package:razertest/states/home/home_state.dart';
import 'package:razertest/ui/screens/home/widgets/user_cardview.dart';

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

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (_, state) {
            if (state.status == HomeStateStatus.loading) {
              return _buildLoading();
            }
            if (state.error != null) {
              return _buildError();
            }

            return _buildContent(state.contacts);
          },
        ),
      ),
    );
  }

  Widget _buildLoading() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AppImages.loading,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            Text(
              'Loading',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      );

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
