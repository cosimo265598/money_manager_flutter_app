import 'package:flutter/material.dart';
import 'package:money_manger_app/widgets/OverallInOut.dart';
import 'package:money_manger_app/widgets/Statistics.dart';
import 'package:money_manger_app/widgets/addFlow.dart';
import 'package:money_manger_app/widgets/bottombar.dart';
import 'package:money_manger_app/widgets/card.dart';
import 'package:money_manger_app/widgets/listStatistics.dart';
import 'package:money_manger_app/widgets/middlebar.dart';
import 'package:money_manger_app/widgets/movementsFlow.dart';
import 'package:money_manger_app/widgets/pieCharts.dart';
import 'package:money_manger_app/widgets/recentflow.dart';
import 'package:money_manger_app/widgets/topbar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: TopBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Statistics(),
          //PieChartStatistics(),
          OverallINOUT(),
          RecentFlows(),
          //SizedBox(height: 50),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
