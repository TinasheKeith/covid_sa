import 'package:flutter/material.dart';
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/ui/widgets/data_point.dart';

class StatsDataDisplay extends StatelessWidget {
  final Province province;

  StatsDataDisplay({@required this.province});

  @override
  Widget build(BuildContext context) {
    print(province.icu);
    return Column(
      children: <Widget>[
        DataPointRow(
          title: "Cases",
          value: (province.cases != null && province.cases.length > 0)
              ? int.parse(province.cases.last)
              : 0,
          title2: "Deaths",
          value2: (province.deaths != null && province.deaths.length > 0)
              ? int.parse(province.deaths.last)
              : 0,
        ),
        DataPointRow(
          title: "Hospital",
          value: (province.hospital != null && province.hospital.length > 0)
              ? int.parse(province.hospital.last)
              : 0,
          title2: "ICU",
          value2: (province.icu != null && province.icu.length > 0)
              ? int.parse(province.icu.last)
              : 0,
        ),
        DataPointRow(
          title: "Tests",
          value: (province.tests != null && province.tests.length > 0)
              ? int.parse(province.tests.last)
              : 0,
          title2: "Recoveries",
          value2: province.recoveries != null
              ? int.parse(province.recoveries.last)
              : 0,
        ),
      ],
    );
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
