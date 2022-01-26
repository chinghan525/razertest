import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/domain/entities/contact.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen(this.contact);

  final Contact contact;

  @override
  State<StatefulWidget> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Profile Photo
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvaqRdxGoQ1qP5Ia6RUExqTixoPRDglzT_IdbWCPnXA2nC6cOas6ihdIXjAdKhqSls9B8&usqp=CAU'),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ],
            ),
          ), //Cen

          // Username
          Center(
            child: Text(
              widget.contact.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
          ),

          SizedBox(height: 16),

          // Email
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
              Flexible(
                child: Text(
                  widget.contact.email,
                  style: TextStyle(
                    color: AppColors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Address
          Row(
            children: [
              Text(
                "Address: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Flexible(
                child: Text(
                  widget.contact.address,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Gender
          Row(
            children: [
              Text(
                "Gender: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Flexible(
                child: Text(
                  widget.contact.gender,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Phone
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Phone: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Mobile
                    Row(
                      children: [
                        Text(
                          "Mobile: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            widget.contact.phone.mobile,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Home
                    Row(
                      children: [
                        Text(
                          "Home: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            widget.contact.phone.home,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Office
                    Row(
                      children: [
                        Text(
                          "Office: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            widget.contact.phone.office,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
}
