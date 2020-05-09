import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:covid_sa/blocs/blocs.dart';
import 'package:covid_sa/ui/screens/screens.dart';

class App extends StatelessWidget {
  final Color primaryColor = Color(0xFFEB5252);
  final Color canvasColor = Color(0xFF1A1B25);
  final Color appFontColor = Colors.white;
  final Color cardColor = Color(0xFF242535);
  final Color cardFontColor = Color(0xFF54556E);

  final double borderRadius = 12;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CovidSA",
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        cardColor: cardColor,
        textTheme: GoogleFonts.ralewayTextTheme().copyWith(
          bodyText1: GoogleFonts.raleway().copyWith(color: Colors.white),
          bodyText2: GoogleFonts.raleway()
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          headline6: GoogleFonts.raleway().copyWith(
            color: cardFontColor,
            fontWeight: FontWeight.bold,
          ),
          caption: GoogleFonts.raleway().copyWith(
            color: Colors.white54,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            
          ),
          subtitle2: GoogleFonts.raleway().copyWith(
            color: cardFontColor,
            fontSize: 16,
          ),
          subtitle1: GoogleFonts.raleway().copyWith(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(
          color: canvasColor,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      routes: {
        "/": (context) => HomeScreen(),
      },
    );
  }
}
