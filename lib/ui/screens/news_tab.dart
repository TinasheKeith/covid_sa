import 'package:flutter/material.dart';

import 'package:covid_sa/blocs/blocs.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NewsTab extends StatefulWidget {
  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          return FlutterLogo();
        }
        if (state is NewsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NewsError) {
          return Center(
            child: Text("ERRORRR"),
          );
        }
        return Center(
          child: RaisedButton(
            color: Colors.white,
            onPressed: () {},
            child: Text("Fetch"),
          ),
        );
      },
    );
  }
}
