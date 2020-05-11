import 'package:flutter/material.dart';

class DataPoint extends StatelessWidget {
  final int value;
  final String title;

  DataPoint({@required this.value, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          value.toString(),
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Color(0xFF54556E)),
        ),
        SizedBox(height: 8),
        Text(title, style: Theme.of(context).textTheme.subtitle2),
      ],
    );
  }
}
