import 'package:covid_sa/ui/widgets/app_webview.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid_sa/blocs/blocs.dart';
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/ui/widgets/flare_animations/no_wifi.dart';

class NewsTab extends StatelessWidget {
  openArticleUrl(String url, BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => AppWebView(url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          final NewsArticles newsArticles = state.newsArticles;
          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      newsArticles.articles[0].title,
                      style: TextStyle(fontSize: 14),
                    ),
                    titlePadding: const EdgeInsets.only(bottom: 16),
                    background: Image.network(
                      newsArticles.articles[0].urlToImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: ListView.builder(
              itemCount: newsArticles.articles.length,
              itemBuilder: (BuildContext context, int i) {
                return NewsCard(
                  article: newsArticles.articles[i],
                );
              },
            ),
          );
        }
        if (state is NewsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NewsError) {
          return Center(
            child: NoWifi(),
          );
        }
        return Text(
          "ERROR WITH STATE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 80,
          ),
        );
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  final Article article;

  NewsCard({this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      bottomLeft: const Radius.circular(12)),
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(article.title,
                          style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
