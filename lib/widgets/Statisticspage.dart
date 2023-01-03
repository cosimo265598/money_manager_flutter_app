import 'package:flutter/material.dart';
import 'package:money_manger_app/widgets/StackedColumns.dart';
import 'package:money_manger_app/widgets/StatForCategory.dart';
import 'package:money_manger_app/widgets/listStatistics.dart';
import 'package:money_manger_app/widgets/middlebar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Statisticspage extends StatefulWidget {
  const Statisticspage({super.key});

  @override
  State<Statisticspage> createState() => _StatisticspageState();
}


class _StatisticspageState extends State<Statisticspage> {


  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return SlidingUpPanel(
      maxHeight: MediaQuery.of(context).size.height *1,
      panel: Center(
        child: StatsForCategory(),
      ),
      collapsed: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: radius,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * 0.3,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: 10,),
              Text(
                "EXPENSE FOR CATEGORY",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Center(
          child: Column(
            children: [
              StatsCards(),
              StackedChart(),
            ],
          )
      ),
      borderRadius: radius,
    );
  }
}