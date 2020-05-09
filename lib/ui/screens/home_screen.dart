import 'package:covid_sa/ui/screens/news_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:covid_sa/ui/widgets/app_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Map> _tabs = [
    {
      "icon": Icons.pie_chart,
      "title": "Stats",
    },
    {
      "icon": CupertinoIcons.news_solid,
      "title": "News",
    },
    {
      "icon": CupertinoIcons.check_mark_circled_solid,
      "title": "Assess",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<String>(context),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3,
          tabs: _tabs
              .map((tab) => AppTab(icon: tab["icon"], title: tab["title"]))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(),
          NewsTab(),
          Center(),
        ],
      ),
    );
  }
}
