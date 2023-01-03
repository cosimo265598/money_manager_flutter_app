import 'package:flutter/material.dart';
import 'package:money_manger_app/models/moneyFlow.dart';
import 'package:pie_chart/pie_chart.dart';

class StatsCards extends StatefulWidget {
  const StatsCards({super.key});

  @override
  State<StatsCards> createState() => _StatsCardsState();
}

class _StatsCardsState extends State<StatsCards> {
  int selectedIndex = 0;
  //listFlows.map((e) => e.dateTime==DateTime.now()).toList();
  List<String> listPeriodsOfStats = [
    "Today",
    "Yesterday",
    "Week",
    "Month",
    "Year",
  ];
  final dataMap = <String, double>{
    "Income": 5,
    "Outcome": 3,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listPeriodsOfStats.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(38.0),
                          topRight: Radius.circular(38.0),
                          bottomLeft: Radius.circular(38),
                          bottomRight: Radius.circular(38)),
                    ),


                    //color: Colors.blueGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(

                            child: Text(
                              listPeriodsOfStats[index],
                              style: TextStyle(
                                  color: index == selectedIndex
                                      ? Colors.black45
                                      : Colors.black26,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.4),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 130,
                            child: PieChart(
                              dataMap: retriveStatsFromDataFlows(listFlows, listPeriodsOfStats[index]),
                              chartType: ChartType.disc,
                              baseChartColor: Colors.blueGrey[50]!.withOpacity(0.80),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: false,
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesOutside: true,
                                decimalPlaces: 2,
                              ),
                              totalValue: retriveStatsFromDataFlows(listFlows, listPeriodsOfStats[index]).values.reduce((value, element) => value+element),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
    );
  }
}
