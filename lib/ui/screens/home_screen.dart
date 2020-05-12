import 'package:covid_sa/ui/screens/home_tab.dart';
import 'package:covid_sa/ui/screens/menu.dart';
import 'package:covid_sa/ui/screens/news_tab.dart';
import 'package:covid_sa/ui/screens/stats_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:covid_sa/ui/widgets/app_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _animationController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController _tabController;

  final List<Map> _tabs = [
    {
      "icon": Icons.home,
      "title": "Home",
    },
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
    _tabController = TabController(length: 4, vsync: this);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  final double maxSlide = 225.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        double slide = maxSlide * _animationController.value;
        double scale = 1 - (_animationController.value * 0.3);
        return Stack(
          children: [
            Menu(),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.centerLeft,
              child: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  leading:
                      IconButton(icon: Icon(Icons.settings, size: 24), onPressed: toggle),
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
                        .map((tab) =>
                            AppTab(icon: tab["icon"], title: tab["title"]))
                        .toList(),
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    HomeTab(),
                    StatsTab(),
                    NewsTab(),
                    Center(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
