import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/ui/widgets/info_card.dart';
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
          final NewsArticles newsArticles = state.newsArticles;

          return ListView.builder(
            itemCount: newsArticles.articles.length,
            itemBuilder: (BuildContext context, int i) {
              return InfoCard(
                title: newsArticles.articles[i].title,
                subtitle: newsArticles.articles[i].source.name,
                content: Center(
                  child: FlutterLogo(
                    size: 128,
                  ),
                ),
              );
            },
          );
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
