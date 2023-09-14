import 'package:flutter/material.dart';

class ScoreLegend extends StatelessWidget {
  final List<LegendValue> legends;
  const ScoreLegend({super.key, required this.legends});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class LegendValue {
  final String src, legendName;
  final int val;
  const LegendValue({required this.src, required this.legendName, required this.val});
}
