import 'package:flutter/material.dart';

import 'package:covid_sa/ui/screens/screens.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CovidSA",
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        "/": (context) => HomeScreen(),
      },
    );
  }
}
