import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/ChartData.dart';

class StackedChart extends StatefulWidget {
  const StackedChart({super.key});

  @override
  State<StackedChart> createState() => _StackedChartState();
}

class _StackedChartState extends State<StackedChart> {

  final List<ChartData> chartData = [
    ChartData('Gennaio', 12, 10, ),
    ChartData('Febbraio', 14, 11,),
    ChartData('Marzo', 16, 10, ),
    ChartData('Aprile', 18, 16,)
  ];

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          )
        ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  StackedColumnSeries<ChartData, String>(
                      groupName: 'Income',
                      dataSource: chartData,
                      dataLabelSettings: DataLabelSettings(isVisible: true,showCumulativeValues: true),
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y1
                  ),
                  StackedColumnSeries<ChartData, String>(
                      groupName: 'Expense',
                      dataSource: chartData,
                      dataLabelSettings: DataLabelSettings(isVisible: true,showCumulativeValues: true),
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y2
                  ),
                ]
            ),
          )
      ),
    );
  }
}