import 'package:flutter/material.dart';

class AppTab extends StatelessWidget {
  final IconData icon;
  final String title;

  AppTab({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 24),
          SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
