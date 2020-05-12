import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF403D55),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Settings",
                    style: Theme.of(context).textTheme.headline4),
              ),
              ListTile(
                leading:
                    FaIcon(FontAwesomeIcons.sun, color: Colors.white, size: 24),
                title: Text(
                  "Toggle Theme",
                  style: TextStyle(fontSize: 14),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.bell,
                    color: Colors.white, size: 24),
                title: Text(
                  "Get Notified Daily",
                  style: TextStyle(fontSize: 14),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.book,
                  color: Colors.white,
                  size: 24,
                ),
                onTap: () {},
                title: Text(
                  "About",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
