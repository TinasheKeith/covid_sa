import "package:flutter/material.dart";
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';

class NoWifi extends StatelessWidget {
  final FlareControls controls = FlareControls();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        width: 100,
        child: FlareActor(
          'assets/flare/no_wifi.flr',
          controller: controls,
          animation: "sparks",
        ),
      ),
    );
  }
}
