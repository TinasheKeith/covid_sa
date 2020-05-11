import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget content;

  InfoCard({this.title, this.subtitle, @required this.content})
      : assert(content != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (title != null)
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              SizedBox(height: 8),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.caption,
                ),
              SizedBox(height: 12),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
