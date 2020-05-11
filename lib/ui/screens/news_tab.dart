import 'package:covid_sa/ui/widgets/app_webview.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid_sa/blocs/blocs.dart';
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/ui/widgets/image_card.dart';
import 'package:covid_sa/ui/widgets/flare_animations/no_wifi.dart';

class NewsTab extends StatefulWidget {
  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  openArticleUrl(String url) async {
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
          return ListView.builder(
            itemCount: newsArticles.articles.length,
            itemBuilder: (BuildContext context, int i) {
              return ImageCard(
                title: newsArticles.articles[i].title,
                subtitle: newsArticles.articles[i].source.name,
                urlToImage: newsArticles.articles[i].urlToImage,
                onTap: () => openArticleUrl(newsArticles.articles[i].url),
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
