import 'package:covid_sa/ui/widgets/flare_animations/no_wifi.dart';
import 'package:covid_sa/ui/widgets/info_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid_sa/blocs/blocs.dart';
import 'package:covid_sa/models/covid_stats.dart';
import 'package:covid_sa/ui/widgets/data_point.dart';

class StatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CovidBloc, CovidStatsState>(builder: (context, state) {
      if (state is CovidStatsLoaded) {
        final CountriesSummary countriesSummary = state.countriesSummary;
        final Country southAfricaStats = countriesSummary.countrySummaries
            .where((country) => country.countryCode == "ZA")
            .toList()[0];

        return ListView(
          children: <Widget>[
            InfoCard(
              title: "Global  🌍",
              subtitle:
                  "Updated ${TimeOfDay.fromDateTime(countriesSummary.countrySummaries[0].date)}",
              content: Column(
                children: <Widget>[
                  DataPointRow(
                    title: "Total Confirmed",
                    value: countriesSummary.global.totalConfirmed,
                    title2: "Total Recovered",
                    value2: countriesSummary.global.totalRecovered,
                  ),
                  DataPointRow(
                    title: "Total Deaths",
                    value: countriesSummary.global.totalDeaths,
                    title2: "New Confirmed",
                    value2: countriesSummary.global.newConfirmed,
                  ),
                ],
              ),
            ),
            InfoCard(
              title: "South Africa  🇿🇦",
              subtitle:
                  "Updated ${TimeOfDay.fromDateTime(countriesSummary.countrySummaries[0].date)}",
              content: Column(
                children: <Widget>[
                  DataPointRow(
                    title: "Total Confirmed",
                    value: southAfricaStats.totalConfirmed,
                    title2: "Total Recovered",
                    value2: southAfricaStats.totalRecovered,
                  ),
                  DataPointRow(
                    title: "Total Deaths",
                    value: southAfricaStats.totalDeaths,
                    title2: "New Confirmed",
                    value2: southAfricaStats.newConfirmed,
                  ),
                  DataPointRow(
                    title: "New Deaths",
                    value: southAfricaStats.newDeaths,
                    title2: "New Recovered",
                    value2: southAfricaStats.newRecovered,
                  ),
                ],
              ),
            ),
          ],
        );
      }

      if (state is CovidStatsLoading)
        Center(child: CircularProgressIndicator());

      if (state is CovidStatsError) NoWifi();

      return Center();
    });
  }
}

class DataPointRow extends StatelessWidget {
  final String title;
  final int value;
  final String title2;
  final int value2;

  DataPointRow(
      {@required this.title, @required this.value, this.title2, this.value2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          DataPoint(
            value: value,
            title: title,
          ),
          DataPoint(
            value: value2 ?? null,
            title: title2 ?? "",
          ),
        ],
      ),
    );
  }
}
