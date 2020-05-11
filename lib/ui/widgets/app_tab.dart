import 'package:flutter/material.dart';

class AppTab extends StatelessWidget {
  final IconData icon;
  final String title;

  AppTab({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon),
          SizedBox(height: 4),
          Text(title),
        ],
      ),
    );
  }
}
