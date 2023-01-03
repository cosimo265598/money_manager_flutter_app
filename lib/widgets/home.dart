import 'package:flutter/material.dart';
import 'package:money_manger_app/widgets/OverallBalance.dart';
import 'package:money_manger_app/widgets/card.dart';
import 'package:money_manger_app/widgets/listStatistics.dart';
import 'package:money_manger_app/widgets/middlebar.dart';
import 'package:money_manger_app/widgets/middlebarhome.dart';
import 'package:money_manger_app/widgets/recentflow.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //StatsCards(),
        //OverallBalance(),
        CreditCard(),
        SizedBox(height: 10),
        MiddlebarHome(),
        SizedBox(height: 10),
        RecentFlows(),
      ],
    );
  }
}
