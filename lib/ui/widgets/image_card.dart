import 'package:flutter/material.dart';

class NetworkImageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String urlToImage;
  final Function onTap;

  NetworkImageCard(
      {this.title, this.subtitle, @required this.urlToImage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap ?? onTap,
        child: Card(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                ),
                child: Image.network(urlToImage ?? ""),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (title != null)
                      Text(title, style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 12),
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.caption,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
