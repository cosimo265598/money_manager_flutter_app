import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartStatistics extends StatefulWidget {
  const PieChartStatistics({super.key});

  @override
  State<PieChartStatistics> createState() => _PieChartStatistics();
}

class _PieChartStatistics extends State<PieChartStatistics> {
  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor ,
          borderRadius: BorderRadius.only(
            //bottomLeft: Radius.circular(38.0),
            //bottomRight: Radius.circular(38.0),
          ),
      ),
      //
      height: 180.0,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: PieChart(
        dataMap: dataMap,
        chartType: ChartType.ring,
        baseChartColor: Colors.grey[50]!.withOpacity(0.15),
        chartValuesOptions: ChartValuesOptions(
          showChartValuesInPercentage: true,
        ),
        totalValue: 20,
      ),
    );
  }
}
