import 'package:flutter/material.dart';
import 'package:money_manger_app/boxes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/ChartData.dart';

class StackedChart extends StatefulWidget {
  final String period_selection;
  const StackedChart({super.key, required this.period_selection});

  @override
  State<StackedChart> createState() => _StackedChartState();
}

class _StackedChartState extends State<StackedChart> {
  /*final List<ChartData> chartData = [
    ChartData('Gennaio', 12, 10, ),
    ChartData('Febbraio', 14, 11,),
    ChartData('Marzo', 16, 10, ),
    ChartData('Aprile', 18, 16,),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              )),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: SfCartesianChart(
                enableAxisAnimation: true,
                enableSideBySideSeriesPlacement: true,
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  BarSeries<ChartData, String>(
                      //groupName: '_',
                      dataSource: Boxes.getAmountGivenDateStaked(
                          this.widget.period_selection),

                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.outer,
                          useSeriesColor: true,
                          opacity: 0.6,
                          showCumulativeValues: true,
                          showZeroValue: true),
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data
                          .y1), /*
                  StackedColumnSeries<ChartData, String>(
                      groupName: 'Expense',
                      dataSource: Boxes.getAmountGivenDateStaked("Today", "assets/images/categories/Shopee.png"),
                      dataLabelSettings: DataLabelSettings(isVisible: true,showCumulativeValues: true),
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y2
                  ),*/
                ]),
          )),
    );
  }
}
